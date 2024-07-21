import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_downloader/components/Gradient%20Widget/Gradient%20Wigdet.dart';
import 'package:video_downloader/utils/App%20Colors/constants.dart';
import 'package:video_downloader/view/Whatsapp%20Status%20Screens/Tabs/ImagesTab.dart';
import 'package:video_downloader/view/Whatsapp%20Status%20Screens/Tabs/SavedTab.dart';
import 'package:video_downloader/view/Whatsapp%20Status%20Screens/Tabs/VidoesTab.dart';

class WhatsAppDownloaderScreen extends StatefulWidget {
  const WhatsAppDownloaderScreen({super.key});

  @override
  _WhatsAppDownloaderScreenState createState() =>
      _WhatsAppDownloaderScreenState();
}

class _WhatsAppDownloaderScreenState extends State<WhatsAppDownloaderScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: SafeArea(
        child: DefaultTabController(
            length: 3,
            child: GradientColor(
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  leadingWidth: Get.width * 0.055,
                  backgroundColor: Colors.transparent,
                  leading: Padding(
                    padding: EdgeInsets.only(left: Get.width * 0.035),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Image(
                        image: AssetImage(
                          'images/backarrow.png',
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    'WhatsApp Status Downloader'.tr,
                    style: TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: Get.width * 0.035,
                      fontFamily: 'OpenSauceOne',
                    ),
                  ),
                  bottom: TabBar(
                    tabs: [
                      Tab(text: 'Images'.tr),
                      Tab(text: 'Videos'.tr),
                      Tab(text: 'Saved'.tr),
                    ],
                    indicatorColor: appColor,
                  ),
                ),
                body: const TabBarView(
                  children: [
                    ImagesTab(),
                    VidoesTab(),
                    SavedTab(),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
