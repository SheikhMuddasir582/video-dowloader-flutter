import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:video_downloader/utils/Ad%20Manager/Adhelper.dart';
import 'package:video_downloader/utils/Ad%20Manager/InterstialAdController.dart';
import 'package:video_downloader/view/Settings%20Screen/SettingsScreen.dart';
import 'package:video_downloader/view/Social%20Media%20Screens/video_downloader.dart';
import 'package:video_downloader/view/Walpaper%20Screens/Main%20Screen/Wallpaper_download_screen.dart';
import 'package:video_downloader/view/Whatsapp%20Status%20Screens/Choose%20Whatsapp/ChooseWhatsappScreen.dart';

// import '../components/custom_navigation_bar.dart';
import '../../components/Buttons Widgets/download_button.dart';
import '../../components/Download Widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    AdManager.loadInterstitialAd();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    Timer(const Duration(seconds: 4), () {
      AdManager.loadInterstitialAd();
    });
  }

  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Video Downloader'.tr),
            automaticallyImplyLeading: false,
            actions: <Widget>[
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'images/unlock.png',
                  width: MediaQuery.of(context).size.width * 0.07,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: SettingScreen(),
                      withNavBar: false,
                    );
                  });
                },
                icon: const Icon(Icons.menu),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                CustomSearchBar(
                  controller: searchController,
                  onrefresh: () {},
                  onSettings: () {
                    // Open settings
                  },
                  onBack: () {
                    // Navigate back
                  },
                  onForward: () {
                    Fluttertoast.showToast(msg: searchController.text);
                  },
                  onMenu: () {
                    // Open menu
                  },
                ),
                Center(
                  child: VideoDownloaderButton(
                    bgColor: const Color(0xffFFF0D9),
                    mainText: 'Video Downloader'.tr,
                    bottomText: 'Download Story, Post & Video'.tr,
                    imgColor: const Color(0xffFF9900),
                    logoImg: Image.asset('images/down.png'),
                    onTap: () {
                      AdUtils.handleAdAndNavigation(
                          context,
                          (p0) => {
                                PersistentNavBarNavigator.pushNewScreen(
                                  context,
                                  screen: const VideoDownloaderScreen(),
                                  withNavBar: true,
                                )
                              });

                      // Handle the button tap
                    },
                  ),
                ),
                Center(
                  child: VideoDownloaderButton(
                    bgColor: const Color(0xffEAFAE7),
                    mainText: 'WhatsApp Status Downloader'.tr,
                    bottomText: 'Download Whatsapp Stories & Status'.tr,
                    imgColor: const Color(0xff71DB60),
                    logoImg: Image.asset('images/whats.png'),
                    onTap: () {
                      AdUtils.handleAdAndNavigation(
                          context,
                          (p0) => {
                                PersistentNavBarNavigator.pushNewScreen(
                                  context,
                                  screen: const ChooseWhatsappScreen(),
                                  withNavBar: true,
                                )
                              });
                    },
                  ),
                ),
                Center(
                  child: VideoDownloaderButton(
                    bgColor: const Color(0xffDCF8FA),
                    mainText: 'Wallpaper Downloader'.tr,
                    bottomText: 'Download Varity of Wallpapers'.tr,
                    imgColor: const Color(0xff12D1DB),
                    logoImg: Image.asset(
                      'images/wallp.png',
                      width: 30,
                    ),
                    onTap: () {
                      AdUtils.handleAdAndNavigation(
                          context,
                          (p0) => {
                                PersistentNavBarNavigator.pushNewScreen(
                                  context,
                                  screen: const WallpaperDownloaderScreen(),
                                  withNavBar: true,
                                )
                              });
                    },
                  ),
                ),
                Center(
                  child: VideoDownloaderButton(
                    bgColor: const Color(0xffF2E7FA),
                    mainText: 'Remove Ads'.tr,
                    bottomText: 'Download everything without Ads'.tr,
                    imgColor: const Color(0xffA660DB),
                    logoImg: Image.asset(
                      'images/removeAd.png',
                    ),
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
