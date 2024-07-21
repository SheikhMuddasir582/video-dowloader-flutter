import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:video_downloader/components/Centreimage.dart';
import 'package:video_downloader/components/CustomAppbarWidget.dart';
import 'package:video_downloader/components/CustomTextWidget.dart';
import 'package:video_downloader/components/SocialHelpButton.dart';
import 'package:video_downloader/utils/Socialmediaenum.dart';
import 'package:video_downloader/view/TutorialScreen.dart';

class HowtoDownloadScreen extends StatefulWidget {
  const HowtoDownloadScreen({super.key});

  @override
  State<HowtoDownloadScreen> createState() => _HowtoDownloadScreenState();
}

class _HowtoDownloadScreenState extends State<HowtoDownloadScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            height: Get.height * 1,
            width: Get.width * 1,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              HexColor('F2E7FA'),
              HexColor('DCF8FA'),
              HexColor('EAFAE7'),
              HexColor('FFF0D9'),
            ], stops: const [
              0,
              30,
              74,
              100
            ])),
            child: Column(
              children: [
                 CustomAppBarWigdet(
                  title: 'Help'.tr,
                ),
                Center(
                  child: Column(
                    children: [
                      const Centreimage(),
                      Padding(
                        padding: EdgeInsets.only(bottom: Get.width * 0.05),
                        child: Center(
                          child: CustomText(text: 'How to Download ?'.tr),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Get.width * 0.049),
                              child: SoicalHelpButton(
                                ontap: () {
                                  Get.to(() => const TutorialScreen(
                                        socialMedia: SocialMedia.facebook,
                                      ));
                                },
                                imagepath: 'images/fbicon.png',
                                title: 'Facebook'.tr,
                              )),
                          SoicalHelpButton(
                              imagepath: 'images/instagram.png',
                              title: 'Instagram'.tr,
                              ontap: () {
                                Get.to(() => const TutorialScreen(
                                      socialMedia: SocialMedia.instagram,
                                    ));
                              }),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Get.width * 0.049),
                            child: SoicalHelpButton(
                              ontap: () {
                                Get.to(() => const TutorialScreen(
                                      socialMedia: SocialMedia.twitter,
                                    ));
                              },
                              imagepath: 'images/twitter.png',
                              title: 'Twitter / X'.tr,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: Get.height * 0.025,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Get.width * 0.049),
                              child: SoicalHelpButton(
                                ontap: () {
                                  Get.to(() => const TutorialScreen(
                                        socialMedia: SocialMedia.tiktok,
                                      ));
                                },
                                imagepath: 'images/tiktok.png',
                                title: 'TikTok'.tr,
                              )),
                          SoicalHelpButton(
                              imagepath: 'images/whatsapp.PNG',
                              title: 'Whatsapp'.tr,
                              ontap: () {
                                Get.to(() => const TutorialScreen(
                                      socialMedia: SocialMedia.whatsapp,
                                    ));
                              }),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Get.width * 0.049),
                            child: SoicalHelpButton(
                              ontap: () {
                                Get.to(() => const TutorialScreen(
                                      socialMedia: SocialMedia.vimeo,
                                    ));
                              },
                              imagepath: 'images/vimeo.png',
                              title: 'Vimeo'.tr,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
