import 'dart:io';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:video_downloader/Provider/Whatsapp%20Status%20Providers/get_status_provider.dart';
import 'package:video_downloader/view/Whatsapp%20Status%20Screens/View%20Status/Image%20View/status_image_view.dart';

class ImagesTab extends StatefulWidget {
  const ImagesTab({super.key});

  @override
  State<ImagesTab> createState() => _ImagesTabState();
}

class _ImagesTabState extends State<ImagesTab> {
  bool _isFetch = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<GetStatusProvider>(builder: (context, file, child) {
      if (_isFetch == false) {
        file.getStatus(".jpg");
        Future.delayed(const Duration(microseconds: 1), () {
          _isFetch = true;
        });
      }
      return file.isWhatsappOn == false
          ? const Center(
              child: Text('WhatsApp not Available'),
            )
          : file.getImages.isEmpty
              ? const Center(
                  child: Text("No Images Found"),
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
                    children: List.generate(file.getImages.length, (index) {
                      final data = file.getImages[index];
                      return GestureDetector(
                        onTap: () {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: StatusImageViewScreen(
                              imagePath: data.path,
                            ),
                            withNavBar: false,
                          );
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
                    }),
                  ),
                );
    });
  }
}
