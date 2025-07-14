import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 20), () {
      if (mounted) {
        context.go('/onboarding');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Donji zrakasti ukras (ako koristiš SVG ili PNG)
          // Positioned(
          //   bottom: 0,
          //   right: 0,
          //   child: Image.asset(
          //     'assets/splash_bg_bottom.svg', // koristi svg ako imaš: SvgPicture.asset
          //     width: 140,
          //   ),
          // ),

          // Gornji zrakasti ukras (ako postoji)
          // Positioned(
          //   top: 0,
          //   left: 0,
          //   width: 100,
          //   child: SvgPicture.asset('assets/splash_bg_top.svg'),
          // ),

          Center(
            child: Image.asset(
              'assets/logo.png',
              width: 160,
            ),
          ),
        ],
      ),
    );
  }
}
