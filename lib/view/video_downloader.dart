import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:video_downloader/components/direct_link.dart';
import 'package:video_downloader/utils/Socialmediaenum.dart';
import 'package:video_downloader/utils/constants.dart';
import 'package:video_downloader/utils/tutorialhelper.dart';
import 'package:video_downloader/view/SocialMediaDownload_Screen.dart';
import 'package:video_downloader/view/TutorialScreen.dart';

import '../components/social_button.dart';

class VideoDownloaderScreen extends StatefulWidget {
  const VideoDownloaderScreen({super.key});

  @override
  State<VideoDownloaderScreen> createState() => _VideoDownloaderScreenState();
}

class _VideoDownloaderScreenState extends State<VideoDownloaderScreen> {
  late Map<SocialMedia, bool> showValues = {};

  @override
  void initState() {
    super.initState();
    _retrieveShowValues();
  }

  Future<void> _retrieveShowValues() async {
    final values = await VideoDownloaderLogic.retrieveShowValues();
    setState(() {
      showValues = values;
    });
  }

  final TextEditingController directController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Video Downloader'.tr),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                padding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: 10.0,
                ),
                decoration: BoxDecoration(
                  color: vsColor,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Social Sites Downloader'.tr,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SocialButton(
                          image: 'images/facebook.png',
                          label: 'Facebook'.tr,
                          onTap: () {
                            if (showValues[SocialMedia.facebook] ?? false) {
                              _updateShowValue(SocialMedia.facebook);
                              Get.to(() => const TutorialScreen(
                                    socialMedia: SocialMedia.facebook,
                                  ));
                            } else {
                              PersistentNavBarNavigator.pushNewScreen(
                                context,
                                screen: SocialMediaDownloadScreen(
                                  appbartitle: 'Facebook'.tr,
                                ),
                                withNavBar: true,
                              );
                            }
                          },
                        ),
                        SocialButton(
                          image: 'images/instagram.png',
                          label: 'Instagram'.tr,
                          onTap: () {
                            if (showValues[SocialMedia.instagram] ?? false) {
                              _updateShowValue(SocialMedia.instagram);
                              Get.to(() => const TutorialScreen(
                                    socialMedia: SocialMedia.instagram,
                                  ));
                            } else {
                              PersistentNavBarNavigator.pushNewScreen(
                                context,
                                screen: SocialMediaDownloadScreen(
                                  appbartitle: 'Instagram'.tr,
                                ),
                                withNavBar: true,
                              );
                            }
                          },
                        ),
                        SocialButton(
                          image: 'images/twitter.png',
                          label: 'Twitter / X'.tr,
                          onTap: () {
                            if (showValues[SocialMedia.twitter] ?? false) {
                              _updateShowValue(SocialMedia.twitter);
                              Get.to(() => const TutorialScreen(
                                    socialMedia: SocialMedia.twitter,
                                  ));
                            } else {
                              PersistentNavBarNavigator.pushNewScreen(
                                context,
                                screen: SocialMediaDownloadScreen(
                                  appbartitle: 'Twitter / X'.tr,
                                ),
                                withNavBar: true,
                              );
                            }
                          },
                        ),
                        SocialButton(
                          image: 'images/tiktok.png',
                          label: 'TikTok'.tr,
                          onTap: () {
                            if (showValues[SocialMedia.tiktok] ?? false) {
                              _updateShowValue(SocialMedia.tiktok);
                              Get.to(() => const TutorialScreen(
                                    socialMedia: SocialMedia.tiktok,
                                  ));
                            } else {
                              PersistentNavBarNavigator.pushNewScreen(
                                context,
                                screen: SocialMediaDownloadScreen(
                                  appbartitle: 'TikTok'.tr,
                                ),
                                withNavBar: true,
                              );
                            }
                          },
                        ),
                        SocialButton(
                          image: 'images/vimeo.png',
                          label: 'Vimeo'.tr,
                          onTap: () {
                            if (showValues[SocialMedia.vimeo] ?? false) {
                              _updateShowValue(SocialMedia.vimeo);
                              Get.to(() => const TutorialScreen(
                                    socialMedia: SocialMedia.vimeo,
                                  ));
                            } else {
                              PersistentNavBarNavigator.pushNewScreen(
                                context,
                                screen: SocialMediaDownloadScreen(
                                  appbartitle: 'Vimeo'.tr,
                                ),
                                withNavBar: true,
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                padding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: 10.0,
                ),
                decoration: BoxDecoration(
                  color: vsColor,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Direct Link Downloader'.tr,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        DirectLinkDownloader(
                          controller: directController,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _updateShowValue(SocialMedia socialMedia) async {
    setState(() {
      showValues[socialMedia] = false;
    });
    await VideoDownloaderLogic.updateShowValue(false, socialMedia);
  }
}
