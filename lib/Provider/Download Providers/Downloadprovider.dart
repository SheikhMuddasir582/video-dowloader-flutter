import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class VideoDownloadProvider extends ChangeNotifier {
  double _downloadProgress = 0.0;
  bool _isDownloading = false;

  double get downloadProgress => _downloadProgress;
  bool get isDownloading => _isDownloading;

  void download(
    String url,
    String Filename,
  ) {
    FileDownloader.downloadFile(
      onDownloadRequestIdReceived: (downloadId) {
        Fluttertoast.showToast(msg: 'Download Started');
      },
      name: Filename,
      url: url,
      onDownloadError: (errorMessage) {
        // showerrortoast();
        _downloadProgress = 0.0;
        _isDownloading = false;
        notifyListeners();
      },
      onProgress: (fileName, progress) {
        _downloadProgress = progress;
        notifyListeners();
        print(progress);
      },
      onDownloadCompleted: (path) {
        _downloadProgress = 0.0;
        _isDownloading = false;
        notifyListeners();
        print(path);
        Fluttertoast.showToast(msg: 'Download Complete');
      },
    );
  }

  void showerrortoast() {
    Fluttertoast.showToast(msg: 'Error Could not Download');
  }

  void Storydown(String Storyurl) async {
    var url =
        Uri.https('instagram-api38.p.rapidapi.com', '/', {'url': Storyurl});

    var response = await http.get(url, headers: {
      'X-RapidAPI-Key': '045c6e7a19msh4cc556c6f562f09p1c4531jsne1f24e53a8be',
      'X-RapidAPI-Host': 'instagram-api38.p.rapidapi.com'
    });

    if (response.statusCode == 200) {
      print('responce ok');
      var data = jsonDecode(response.body);
      print('Data:$data');
      // String? type = data['result']['0']['type'];
      // print(type);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  Future<void> downloadVideo(BuildContext context, String url) async {
    if (url.contains('facebook') ||
        url.contains('instagram') ||
        url.contains('youtube') ||
        url.contains('tiktok')) {
      // if (url.contains('stories') && url.contains('instagram')) {
      //   _isDownloading = true;
      //   Storydown(url);
      //   notifyListeners();
      // } else {
      print('tapped');
      _isDownloading = true;
      notifyListeners();
      //Generel Video Download
      var uri = Uri.https(
        'social-media-video-downloader.p.rapidapi.com',
        '/smvd/get/all',
        {'url': url},
      );

      final headers = {
        'X-RapidAPI-Key': '045c6e7a19msh4cc556c6f562f09p1c4531jsne1f24e53a8be',
        'X-RapidAPI-Host': 'social-media-video-downloader.p.rapidapi.com'
      };

      final response = await http.get(uri, headers: headers);

      if (response.statusCode == 200) {
        print('Got responce');
        final jsonData = jsonDecode(response.body);
        final links = jsonData['links'];
        String videoname = jsonData['title'];
        final availableQualities = <String>[];
        for (var item in jsonData['links']) {
          availableQualities.add(item['quality']);
        }

        for (var item in jsonData['links']) {
          availableQualities.add(item['quality']);
        }
        Future<String?> showdialog(List<String> availableQualities) async {
          return await showDialog<String>(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors.grey.shade500,
                title: const Text('Select Video Quality'),
                content: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: availableQualities.take(5).map((quality) {
                      return TextButton(
                        onPressed: () => Navigator.pop(context, quality),
                        child: Text(quality),
                      );
                    }).toList(),
                  ),
                ),
              );
            },
          );
        }

        final selectedQuality = await showdialog(availableQualities);
        if (selectedQuality != null) {
          for (var item in links) {
            if (item['quality'] == selectedQuality) {
              final downloadLink = item['link'];
              if (selectedQuality == 'mp3' || selectedQuality == 'audio') {
                download(downloadLink, '$videoname.mp3');
              } else {
                download(downloadLink, '$videoname.mp4');
              }
              break;
            }
          }
        }
      } else {
        Fluttertoast.showToast(msg: 'No Quality Selected');
        _isDownloading = false;
        notifyListeners();
      }
    } else if (url.contains('www') ||
        url.contains('https') ||
        url.contains('http')) {
      _isDownloading = true;

      download(
          url,
          url.contains('video')
              ? 'download.mp4'
              : url.contains('mp4')
                  ? 'download.mp4'
                  : url.contains('jpg')
                      ? 'download.jpg'
                      : url.contains('image')
                          ? 'download.jpg'
                          : url.contains('pdf')
                              ? 'download.pdf'
                              : 'download');
    } else {
      Fluttertoast.showToast(msg: 'Invalid Url');
    }
  }
}
