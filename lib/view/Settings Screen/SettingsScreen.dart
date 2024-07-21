import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_downloader/components/Ad%20Widgets/Adbannerwidget.dart';
import 'package:video_downloader/components/Buttons%20Widgets/Lanuage_Change_Button.dart';

import 'package:video_downloader/components/Custom%20Text%20Widgets/HeadingText.dart';
import 'package:video_downloader/components/Download%20Widgets/Downloadwidget.dart';

import 'package:video_downloader/components/Search%20Engine%20Widget/SearchEngineWidget.dart';
import 'package:video_downloader/components/Buttons%20Widgets/TextButtonsWidget.dart';
import 'package:video_downloader/components/Toggle%20Swicthes/ToggleSwitches.dart';
import 'package:video_downloader/view/Home%20Screens/dashboard_screen.dart';
import 'package:video_downloader/view/Tutorials%20Screens/How_to_download_Screen.dart';

class SettingScreen extends StatefulWidget {
  String sellang = 'default'.tr;
  SettingScreen({super.key, this.sellang = 'default'});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String selectedlanguage = '';
  @override
  void initState() {
    super.initState();
    selectedlanguage = widget.sellang;
  }

  bool switch1 = true, switch2 = false, switch3 = false, switch4 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings'.tr,
          style: GoogleFonts.aBeeZee(
            textStyle: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.04,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
        titleSpacing: -15,
        leading: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.01),
          child: InkWell(
            onTap: () {
              setState(() {
                Get.to(const DashboardScreen());
              });
            },
            child: Icon(
              Icons.arrow_back_ios,
              size: MediaQuery.of(context).size.width * 0.04,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Center(
              child: AdbannerWidget(),
            ), // Ad banner Will be shown Here
            Column(children: [
              HeadingText(
                Heading: 'Download'.tr,
              ),
              DownloadLocation(
                ontap: () {
                  //Create function to change download location
                },
              ),
              const Divider(),
              ToggleSwitchWidget(
                onToggle: (bool val) {
                  setState(() {
                    switch1 = val;
                  });
                },
                status: switch1,
                titletext: 'Data Saving Mode'.tr,
                subtitletext: 'Download with Wi-Fi only when turned on'.tr,
              ),
              const Divider(),
              HeadingText(
                Heading: 'Browser'.tr,
              ),
              ToggleSwitchWidget(
                onToggle: (bool val) {
                  setState(() {
                    switch2 = val;
                  });
                },
                status: switch2,
                titletext: 'Block Ads'.tr,
                subtitletext: switch2 ? 'on'.tr : 'off'.tr,
              ),
              const Divider(),
              ToggleSwitchWidget(
                onToggle: (bool val) {
                  setState(() {
                    switch3 = val;
                  });
                },
                status: switch3,
                titletext: 'Save your passwords'.tr,
                subtitletext: switch3 ? 'on'.tr : 'Recommended'.tr,
              ),
              const Divider(),
              SearchEngineWidget(
                  ontap: () {
                    //create function to change search engine
                  },
                  subtitle: 'Google'.tr),
              const Divider(),
              TextButtonsWidget(
                ButtonText: 'Clear Cache'.tr,
                ontap: () {
                  Fluttertoast.showToast(
                      msg: 'Cache Cleared'.tr); //Clear Cache Buttton function
                },
              ),
              const Divider(),
              TextButtonsWidget(
                ButtonText: 'Clear browser history'.tr,
                ontap: () {
                  Fluttertoast.showToast(msg: 'Browser History Cleared'.tr);
                  //Clear Browser History Function
                },
              ),
              const Divider(),
              TextButtonsWidget(
                ButtonText: 'Clear cookies'.tr,
                ontap: () {
                  Fluttertoast.showToast(msg: 'Cleared cookies'.tr);
                  //Clear Browser History Function
                },
              ),
              const Divider(),
              HeadingText(
                Heading: 'General Settings'.tr,
              ),
              const Langaugeoptions(),
              const Divider(),
              ToggleSwitchWidget(
                  status: switch4,
                  titletext: 'Sync To Gallery'.tr,
                  subtitletext: switch4 ? 'on'.tr : 'off'.tr,
                  onToggle: (bool val) {
                    setState(() {
                      switch4 = val;
                    });
                  }),
              const Divider(),
              const HeadingText(Heading: 'Help'),
              TextButtonsWidget(
                  ButtonText: 'How to Download'.tr,
                  ontap: () {
                    Get.to(const HowtoDownloadScreen());
                  }),
              const Divider(),
              TextButtonsWidget(ButtonText: 'Feedback'.tr, ontap: () {}),
              const Divider(),
              TextButtonsWidget(ButtonText: 'Privacy Policy'.tr, ontap: () {})
            ]),
          ],
        ),
      ),
    );
  }
}
