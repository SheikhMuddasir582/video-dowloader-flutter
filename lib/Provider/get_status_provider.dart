import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_downloader/Constants/constants.dart';

class GetStatusProvider with ChangeNotifier {
  List<FileSystemEntity> _getImages = [];
  List<FileSystemEntity> _getVideos = [];

  bool _isWhatsappOn = false;
  bool _hasFetchedVideos = false;

  List<FileSystemEntity> get getImages => _getImages;
  List<FileSystemEntity> get getVideos => _getVideos;

  bool get isWhatsappOn => _isWhatsappOn;

  void getStatus(String exten) async {
    var status = await Permission.manageExternalStorage.request();

    if (status.isDenied) {
      Fluttertoast.showToast(
        msg: 'Permission Denied',
        toastLength: Toast.LENGTH_SHORT,
      );
      return;
    }

    if (status.isGranted) {
      final directory = Directory(VdConstants.WHATSAPP_PATH);

      if (directory.existsSync()) {
        final items = directory.listSync();
        if(!_hasFetchedVideos){
          if (exten == ".mp4") {
          final videosList =
              items.where((element) => element.path.endsWith(".mp4")).toList();
              _getVideos = videosList.cast<File>();
      _hasFetchedVideos = true;
      notifyListeners();
        } 

        }
        log("WhatsApp status directory exists: ${directory.path}");

        // List all files and directories within the status directory
       // final items = directory.listSync();

      //   if (exten == ".mp4") {
      //     _getVideos =
      //         items.where((element) => element.path.endsWith(".mp4")).toList();
      // notifyListeners();
      //   } else {
        if(exten == ".jpg"){
          _getImages =
              items.where((element) => element.path.endsWith(".jpg")).toList();
          notifyListeners();
        }

        
        _isWhatsappOn = true;
        notifyListeners();

        for (var item in items) {
          if (item is File) {
            // Process individual status files here
            log("Found status file: ${item.path}");
          } else if (item is Directory) {
            // Handle directories (if needed)
            log("Found subdirectory: ${item.path}");
          }
        }
        
      } else {
        log("WhatsApp status directory does not exist.");
        
        _isWhatsappOn = true;
        notifyListeners();
      }
    } else {
      Fluttertoast.showToast(
        msg: 'No status image found',
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }
}

// import 'dart:developer';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:video_downloader/Constants/constants.dart';

// class GetStatusProvider with ChangeNotifier {
  // List<FileSystemEntity> _getImages = [];
  // List<FileSystemEntity> _getVideos = [];

  // bool _isWhatsappOn = false;

  // List<FileSystemEntity> get getImages => _getImages;
  // List<FileSystemEntity> get getVideos => _getVideos;

  // bool get isWhatsappOn => _isWhatsappOn;

//   void getStatus(String exten) async {
//     //final status= await Permission.storage.request();

//     var status = await Permission.manageExternalStorage.request();

//     if (status.isDenied) {
//       Fluttertoast.showToast(
//           msg: 'Permission Denied', toastLength: Toast.LENGTH_SHORT);
//       return;
//     }
//     if (status.isGranted) {
//       final directory = Directory(VdConstants.WHATSAPP_PATH);
//       if (directory.existsSync()) {
//         final items = directory.listSync();

        // if (exten == ".mp4") {
        //   _getVideos =
        //       items.where((element) => element.path.endsWith(".mp4")).toList();
        //   notifyListeners();
        // } else {
        //   _getImages =
        //       items.where((element) => element.path.endsWith(".jpg")).toList();
        //   notifyListeners();
        // }

        // _isWhatsappOn = true;
        // notifyListeners();

//         //log(items.toString());
//          for (var item in items) {
//           if (item is File) {
//             // Process individual status files here
//             log("Found status file: ${item.path}");
//           } else if (item is Directory) {
//             // Handle directories (if needed)
//             log("Found subdirectory: ${item.path}");
//           }
//         }
//       } else {
//         log("WhatsApp status directory does not exist.");
//       }
//       }
//        else {
//         Fluttertoast.showToast(
//             msg: 'No status image found', toastLength: Toast.LENGTH_SHORT);
//       }
      // _isWhatsappOn = false;
      // notifyListeners();
//     }
//   }
