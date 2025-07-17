import 'package:flutter/material.dart';
import 'package:instagramclone/widgtes/BottomNavigationbar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const InstaBottomNav(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                "assets/images/instagram logo.png",
                height: 70,
                width: 70,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            "from",
            style: TextStyle(
              color: Color(0xff767676),
              fontSize: 15,
            ),
          ),
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                colors: [
                  Color(0xFF833AB4),
                  Color(0xFFFD1D1D),
                  Color(0xFFFCB045),
                ],
                tileMode: TileMode.clamp,
              ).createShader(bounds);
            },
            child: Text(
              "Meta",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
