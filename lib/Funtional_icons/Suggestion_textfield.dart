import 'package:flutter/material.dart';

class SuggestionTextField extends StatefulWidget {
  final List<String> suggestions;
  final String labelText;
  final void Function(String) onSuggestionSelected;

  const SuggestionTextField({
    super.key,
    required this.suggestions,
    required this.labelText,
    required this.onSuggestionSelected,
  });

  @override
  State<SuggestionTextField> createState() => _SuggestionTextFieldState();
}

class _SuggestionTextFieldState extends State<SuggestionTextField> {
  final LayerLink _layerLink = LayerLink();
  final FocusNode _focusNode = FocusNode();
  OverlayEntry? _overlayEntry;
  late TextEditingController controller;

  List<String> filteredSuggestions = [];

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        removeOverlay();
      }
    });
  }

  void showOverlay() {
    removeOverlay();

    _overlayEntry = _createOverlayEntry();
    final overlay = Overlay.of(context);
    if (_overlayEntry != null) {
      overlay.insert(_overlayEntry!);
    }
  }

  void removeOverlay() {
    if (_overlayEntry != null && _overlayEntry!.mounted) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    Size size = renderBox.size;

    return OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0.0, size.height + 5),
          child: Material(
            elevation: 4,
            color: const Color(0xff262626),
            borderRadius: BorderRadius.circular(10),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.5),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: filteredSuggestions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      filteredSuggestions[index],
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      controller.text = filteredSuggestions[index];
                      removeOverlay();
                      widget.onSuggestionSelected(filteredSuggestions[index]);
                      FocusScope.of(context).unfocus();
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    _focusNode.dispose();
    removeOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: TextField(
        controller: controller,
        focusNode: _focusNode,
        cursorColor: Color(0xff868686),
        style: TextStyle(color: Colors.white),
        onChanged: (value) {
          filteredSuggestions = widget.suggestions
              .where((s) => s.toLowerCase().contains(value.toLowerCase()))
              .toList();

          if (value.isNotEmpty && filteredSuggestions.isNotEmpty) {
            showOverlay();
          } else {
            removeOverlay();
          }
        },
        decoration: InputDecoration(
          fillColor: Color(0xff262626),
          filled: true,
          prefixIcon: Icon(Icons.search, color: Color(0xff868686)),
          hintText: widget.labelText,
          labelStyle: TextStyle(color: Color(0xff868686)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: Color(0xff262626)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: Color(0xff262626)),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
    );
  }
}
