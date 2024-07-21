import "dart:io";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:video_downloader/Provider/get_status_provider.dart";
import "package:video_downloader/utils/getThumbnails.dart";
import "package:video_downloader/view/status_video_view.dart";

import "../utils/constants.dart";

class GetVideosStatus extends StatefulWidget {
  const GetVideosStatus({super.key});

  @override
  State<GetVideosStatus> createState() => _GetVideosStatusState();
}

class _GetVideosStatusState extends State<GetVideosStatus> {
  bool _isFetch = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<GetStatusProvider>(
      builder: (context, fileProvider, child) {
        if (!_isFetch) {
          fileProvider.getStatus(".mp4");
          _isFetch = true;
        }

        if (!fileProvider.isWhatsappOn) {
          return Center(
            child: Text('WhatsApp not Available'),
          );
        }

        if (fileProvider.getVideos.isEmpty) {
          return Center(
            child: Text("No Videos Found"),
          );
        }

        return Container(
          padding: EdgeInsets.all(20),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: fileProvider.getVideos.length,
            itemBuilder: (context, index) {
              final data = fileProvider.getVideos[index];
              return FutureBuilder<String>(
                future: getThumbnails(data.path),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StatusVideoViewScreen(
                              videoPath: data.path,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          image: DecorationImage(
                            image: FileImage(File(snapshot.data!)),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.play_circle_outline,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(color: appColor),
                    );
                  }
                },
              );
            },
          ),
        );
      },
    );

//     return Consumer<GetStatusProvider>(
//   builder: (context, file, child) {
//     if (_isFetch== false) {
//       // Fetch status videos (limit the initial fetch)
//       file.getStatus(".mp4");
//       Future.delayed(const Duration(microseconds: 1), () {
//         _isFetch = true;
//       });
//     }

//     return file.isWhatsappOn == false
//         ? Center(
//             child: Text('WhatsApp not Available'),
//           )
//         : file.getVideos.isEmpty
//             ? Center(
//                 child: Text("No Videos Found"),
//               )
//             : Container(
//                 padding: EdgeInsets.all(20),
//                 child: GridView.builder(
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     crossAxisSpacing: 8,
//                     mainAxisSpacing: 8,
//                   ),
//                   itemCount: file.getVideos.length,
//                   itemBuilder: (context, index) {
//                     final data = file.getVideos[index];
//                     return FutureBuilder<String>(
//                       future: getThumbnails(data.path),
//                       builder: (context, snapshot) {
//                         if (snapshot.hasData) {
//                           return GestureDetector(
//                             onTap: () {
//                               // Navigate to video view screen
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => StatusVideoViewScreen(
//                                     videoPath: data.path,
//                                   ),
//                                 ),
//                               );
//                             },
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 color: Colors.transparent,
//                                 image: DecorationImage(
//                                   image: FileImage(File(snapshot.data!)),
//                                   fit: BoxFit.cover,
//                                 ),
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: const Center(
//                                 child: Icon(
//                                   Icons.play_circle_outline,
//                                   color: Colors.white,
//                                   size: 50,
//                                 ),
//                               ),
//                             ),
//                           );
//                         } else {
//                           // Show loading indicator while thumbnail is being fetched
//                           return const Center(
//                             child: CircularProgressIndicator(color: appColor),
//                           );
//                         }
//                       },
//                     );
//                   },
//                 ),
//               );
//   },
// );
  }
}
