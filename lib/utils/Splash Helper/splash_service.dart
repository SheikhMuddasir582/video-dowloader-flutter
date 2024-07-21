import 'dart:async';

import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_downloader/view/Home%20Screens/dashboard_screen.dart';
import 'package:video_downloader/view/Langauge%20Screens/language_selection.dart';

class SplashService {
  static Future<void> splashService(BuildContext context) async {
    bool show = await retrieveShowValueFromSharedPreferences();
    Timer(const Duration(seconds: 3), () {
      if (show == true) {
        PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: const DashboardScreen(),
          withNavBar: true,
          //customPageRoute: MaterialPageRoute(builder: (context)=> FinishedScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LanguageSelection()),
        );
      }
    });
  }

  static Future<bool> retrieveShowValueFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('show') ?? false;
  }
}
