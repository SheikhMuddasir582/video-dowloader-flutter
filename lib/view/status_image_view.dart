import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_downloader/Constants/constants.dart';
import 'package:video_downloader/utils/constants.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class StatusImageViewScreen extends StatefulWidget {
  final String? imagePath;
  const StatusImageViewScreen({super.key, this.imagePath});

  @override
  State<StatusImageViewScreen> createState() => _StatusImageViewScreenState();
}

class _StatusImageViewScreenState extends State<StatusImageViewScreen> {
  Future<String> createFolder(String mainFolderName, String saveFolderName) async {
    // Get the application documents directory
    //final appDocumentsDir = await getExternalStorageDirectory();
   final directory = Directory(VdConstants.saveImage);
    // Create the folder path
    final folderPath = '${directory.path}/$mainFolderName/$saveFolderName';

    // Create the folder if it doesn't exist
    if (!Directory(folderPath).existsSync()) {
      Directory(folderPath).createSync(recursive: true);
    }
    log(folderPath);

    return folderPath;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: FileImage(
              File(widget.imagePath!),
            ),
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: appColor,
        foregroundColor: Colors.white,
        onPressed: () async {
          final mainfolderName = 'Video Downloader';
          final savefolderName = 'Statuses'; // Specify the folder name
          final folderPath = await createFolder(mainfolderName, savefolderName);

          // Copy the image file to the new path
          final originalImageName = widget.imagePath!.split('/').last;
          final newImagePath = '$folderPath/$originalImageName';

          final File originalImageFile = File(widget.imagePath!);
          final File newImageFile = await originalImageFile.copy(newImagePath);
          // File(widget.imagePath!).copySync(newImagePath);

          // ScaffoldMessenger.of(context).showSnackBar(
          //   const SnackBar(content: Text('Image Saved')),

          // );
          log(newImageFile.path);
          ImageGallerySaver.saveFile(newImageFile.path)
              .then((value) => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Image Saved')),
              ));
        },
        child: const Icon(
          Icons.download,
        ),
      ),
    );
  }
}
