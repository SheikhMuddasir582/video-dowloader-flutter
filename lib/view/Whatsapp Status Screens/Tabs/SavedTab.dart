import 'dart:io';

import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:video_downloader/Provider/Whatsapp%20Status%20Providers/saved_files_provider.dart';
import 'package:video_downloader/utils/Thumnails%20Helper/getThumbnails.dart';
import 'package:video_downloader/view/Whatsapp%20Status%20Screens/Saved%20Status/save_img_view_screen.dart';
import 'package:video_downloader/view/Whatsapp%20Status%20Screens/Saved%20Status/saved_video_status.dart';
class SavedTab extends StatefulWidget {
  const SavedTab({super.key});

  @override
  State<SavedTab> createState() => _SavedTabState();
}

class _SavedTabState extends State<SavedTab> {
  bool _isFetch = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<SavedStatusProvider>(builder: (context, file, child) {
      if (!_isFetch) {
        file.getStatus(".jpg");
        Future.delayed(const Duration(microseconds: 1), () {
          //_isFetch = true;
        });
        file.getStatus(".mp4");
        Future.delayed(const Duration(microseconds: 1), () {
          _isFetch = true;
        });
      }
      return file.isWhatsappOn == false
          ? const Center(
              child: Text('WhatsApp not Available'),
            )
          : file.getFiles.isEmpty
              ? const Center(
                  child: Text("No Videos Found"),
                )
              : Container(
                  padding: const EdgeInsets.all(20),
                  child: GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    children: List.generate(file.getFiles.length, (index) {
                      final data = file.getFiles[index];

                      return FutureBuilder<String>(
                          future: getThumbnails(data.path),
                          builder: (context, snapshot) {
                            return snapshot.hasData
                                ? GestureDetector(
                                    onTap: () {
                                      PersistentNavBarNavigator.pushNewScreen(
                                        context,
                                        screen: SavedStatusVideoViewScreen(
                                          videoPath: data.path,
                                        ),
                                        withNavBar: false,
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        image: DecorationImage(
                                          image: FileImage(
                                            File(snapshot.data!),
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      {
                                        PersistentNavBarNavigator.pushNewScreen(
                                          context,
                                          screen: SavedStatusImageViewScreen(
                                            imagePath: data.path,
                                          ),
                                          withNavBar: false,
                                        );
                                      }
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
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  );
                          });
                    }),
                  ),
                );
    });
  }
}
