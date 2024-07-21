

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_downloader/components/Ad%20Widgets/ad_container.dart';
import 'package:video_downloader/components/Download%20Widgets/enter_url.dart';
import 'package:video_downloader/components/Buttons%20Widgets/paste_button.dart';

class DownloaderWidget extends StatelessWidget {
  const DownloaderWidget({
    super.key,
    required this.urlController,
  });

  final TextEditingController urlController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          EnterUrl(onTap: (){
      
          }, controller: urlController,
          ),
          const AdContainer(),
      
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            PasteButton(
            title: 'Paste'.tr, 
            onTap: (){
      
          }
          ),
      
          PasteButton(
            title: 'Download'.tr, 
            onTap: (){
      
          }
          ),
            ],
          )
      
        ],
      ),
    );
  }
}