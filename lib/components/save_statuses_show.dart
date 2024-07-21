import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/saved_files_provider.dart';
import '../utils/getThumbnails.dart';
import '../view/save_img_view_screen.dart';
import '../view/saved_video_status.dart';

class SavedStatusShow extends StatefulWidget {
  const SavedStatusShow({super.key});

  @override
  State<SavedStatusShow> createState() => _SavedStatusShowState();
}

class _SavedStatusShowState extends State<SavedStatusShow> {
  bool _isFetch= false;
  @override
  Widget build(BuildContext context) {
    return Consumer<SavedStatusProvider>(
                          builder: (context, file, child) {
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
                            ? Center(
                                child: Text('WhatsApp not Available'),
                              )
                            : file.getFiles.isEmpty
                                ? Center(
                                    child: Text("No Videos Found"),
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
                                          file.getFiles.length, (index) {
                                        final data = file.getFiles[index];

                                        return FutureBuilder<String>(
                                            future: getThumbnails(data.path),
                                            builder: (context, snapshot) {
                                              return snapshot.hasData
                                                  ? GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        SavedStatusVideoViewScreen(
                                                                          videoPath:
                                                                              data.path,
                                                                        )));
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors
                                                              .transparent,
                                                          image:
                                                              DecorationImage(
                                                            image: FileImage(
                                                              File(snapshot
                                                                  .data!),
                                                            ),
                                                            fit: BoxFit.cover,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                      ),
                                                    )
                                                  : GestureDetector(
                                                      onTap: () {
                                                        {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          SavedStatusImageViewScreen(
                                                                            imagePath:
                                                                                data.path,
                                                                          )));
                                                        }
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors
                                                              .transparent,
                                                          image:
                                                              DecorationImage(
                                                            image: FileImage(
                                                              File(data.path),
                                                            ),
                                                            fit: BoxFit.cover,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
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