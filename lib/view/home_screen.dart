import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:video_downloader/utils/Adhelper.dart';
import 'package:video_downloader/utils/InterstialAdController.dart';
import 'package:video_downloader/view/SettingsScreen.dart';
import 'package:video_downloader/view/video_downloader.dart';
import 'package:video_downloader/view/wallpaper_downloader.dart';
import 'package:video_downloader/view/whatsapp_downloader.dart';

// import '../components/custom_navigation_bar.dart';
import '../components/download_button.dart';
import '../components/search_bar.dart';

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
                  onrefresh: () {
                    // Implement search logic
                  },
                  onSettings: () {
                    // Open settings
                  },
                  onBack: () {
                    // Navigate back
                  },
                  onForward: () {
                    // Navigate forward
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
                                  screen: const WhatsAppDownloaderScreen(),
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
