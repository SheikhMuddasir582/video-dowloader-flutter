import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_downloader/components/App%20Bars/CustomAppbarWidget.dart';
import 'package:video_downloader/components/Buttons%20Widgets/SocialHelpButton.dart';
import 'package:video_downloader/components/Custom%20Text%20Widgets/CustomTextWidget.dart';
import 'package:video_downloader/components/Gradient%20Widget/Gradient%20Wigdet.dart';
import 'package:video_downloader/components/Image%20WIdgets/Centreimage.dart';
import 'package:video_downloader/utils/Social%20Media%20Enum/Socialmediaenum.dart';
import 'package:video_downloader/view/Tutorials%20Screens/TutorialScreen.dart';

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
          body: GradientColor(
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
                        padding:
                            EdgeInsets.symmetric(horizontal: Get.width * 0.049),
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
                        padding:
                            EdgeInsets.symmetric(horizontal: Get.width * 0.049),
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
        ),
      )),
    );
  }
}
