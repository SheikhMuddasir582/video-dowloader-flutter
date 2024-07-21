import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_downloader/utils/Splash%20Helper/splash_service.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool show = false;
  Future<bool> retrieveShowValueFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('show') ?? false;
  }

  @override
  void initState() {
    super.initState();
    SplashService.splashService(context);
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(size.width * 0.05), // Responsive padding
              child: Image(
                image: const AssetImage(
                  'images/splash_pic.png',
                ),
                width: size.width * 1.0, // Responsive image size
                height: size.height * 0.3, // Responsive image size
              ),
            ),
            Text(
              'Video Downloader',
              style: TextStyle(
                color: const Color(0xffA660DB),
                fontSize: size.width * 0.06, // Responsive font size
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSauceOne',
              ),
            ),
            const Spacer(), // Use Spacer for flexible spacing
            Padding(
              padding: EdgeInsets.only(
                  bottom: size.height * 0.04), // Responsive padding
              child: const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xffA660DB)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
