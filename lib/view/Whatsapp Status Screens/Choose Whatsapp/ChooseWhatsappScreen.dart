import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:video_downloader/components/App%20Bars/CustomAppbarWidget.dart';
import 'package:video_downloader/components/Buttons%20Widgets/WhatsappButtons.dart';
import 'package:video_downloader/components/Gradient%20Widget/ButtonGradient.dart';
import 'package:video_downloader/components/Gradient%20Widget/Gradient%20Wigdet.dart';
import 'package:video_downloader/utils/Ad%20Manager/Adhelper.dart';
import 'package:video_downloader/utils/App%20Colors/constants.dart';
import 'package:video_downloader/view/Whatsapp%20Status%20Screens/Main%20Screen/whatsapp_downloader.dart';

import '../../../Provider/Whatsapp Status Providers/get_status_provider.dart';

class ChooseWhatsappScreen extends StatefulWidget {
  const ChooseWhatsappScreen({super.key});

  @override
  State<ChooseWhatsappScreen> createState() => _ChooseWhatsappScreenState();
}

class _ChooseWhatsappScreenState extends State<ChooseWhatsappScreen> {

  @override
  Widget build(BuildContext context) {
    //to set the directory of whatsapps through this variable
    final getStatusProvider = Provider.of<GetStatusProvider>(context, listen: false);

    return SafeArea(
      child: GradientColor(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              CustomAppBarWigdet(title: 'Whatsapp Status Downloader'.tr),
              Padding(
                padding: EdgeInsets.only(
                    top: Get.height * 0.03, right: Get.width * 0.18),
                child: Center(
                  child: WhatsapppButton(
                    textcolor: Colors.white,
                    bgcolor: appColor,
                    mainText: 'WhatsApp Status \n Downloader'.tr,
                    logoImg: 'images/Iconwhatsapp.png',
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
                              //user will select the directory
                              getStatusProvider.selectDirectory(false);
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: Get.height * 0.015, right: Get.width * 0.18),
                child: Center(
                  child: ButtonGradient(
                    child: WhatsapppButton(
                      textcolor: Colors.black,
                      bgcolor: Colors.transparent,
                      mainText: 'WhatsApp Business\nStatus Downloader'.tr,
                      logoImg: 'images/Business.png',
                      onTap: () {
                        // Add Function For Business Whatsapp
                        AdUtils.handleAdAndNavigation(
                            context,
                            (p0) => {
                                  PersistentNavBarNavigator.pushNewScreen(
                                    context,
                                    screen: const WhatsAppDownloaderScreen(),
                                    withNavBar: true,
                                  )
                                });
                                //user will select the directory
                              getStatusProvider.selectDirectory(true);
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
