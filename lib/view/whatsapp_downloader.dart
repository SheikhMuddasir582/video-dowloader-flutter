import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:video_downloader/Provider/get_status_provider.dart';
import 'package:video_downloader/components/get_videos_status.dart';
import 'package:video_downloader/components/save_statuses_show.dart';
import 'package:video_downloader/utils/constants.dart';
import 'package:video_downloader/view/status_image_view.dart';

class WhatsAppDownloaderScreen extends StatefulWidget {
  const WhatsAppDownloaderScreen({super.key});

  @override
  _WhatsAppDownloaderScreenState createState() =>
      _WhatsAppDownloaderScreenState();
}

class _WhatsAppDownloaderScreenState extends State<WhatsAppDownloaderScreen> {
  bool _isFetch = false;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: SafeArea(
        child: DefaultTabController(
            length: 3,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  HexColor('F2E7FA'),
                  HexColor('F2E7FA'),
                  HexColor('DCF8FA'),
                  HexColor('EAFAE7'),
                  HexColor('FFF0D9'),
                ], stops: const [
                  0,
                  0,
                  30,
                  74,
                  100
                ])),
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
                  body: TabBarView(
                    children: [
                      // Center(child: Text('Images'.tr())),
                      //Text('Images'),
                      Consumer<GetStatusProvider>(
                          builder: (context, file, child) {
                        if (_isFetch == false) {
                          file.getStatus(".jpg");
                          Future.delayed(const Duration(microseconds: 1), () {
                            _isFetch = true;
                          });
                        }
                        return file.isWhatsappOn == false
                            ? Center(
                                child: Text('WhatsApp not Available'),
                              )
                            : file.getImages.isEmpty
                                ? Center(
                                    child: Text("No Images Found"),
                                  )
                                : Container(
                                    padding: EdgeInsets.all(20),
                                    child: GridView(
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 8,
                                        mainAxisSpacing: 8,
                                      ),
                                      children: List.generate(
                                          file.getImages.length, (index) {
                                        final data = file.getImages[index];
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        StatusImageViewScreen(
                                                          imagePath: data.path,
                                                        )));
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              image: DecorationImage(
                                                image: FileImage(
                                                  File(data.path),
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                  );
                      }),
                      // Center(child: Text('Videos'.tr())),
                     const GetVideosStatus(),

                      // Center(child: Text('Saved'.tr())),
                      const SavedStatusShow(),
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
