
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_downloader/components/CustomTextWidget.dart';
import 'package:video_downloader/components/SubtitleTextWIdget.dart';


class SearchEngineWidget extends StatelessWidget {
  final VoidCallback ontap;
 final String subtitle;
  const SearchEngineWidget({super.key, required this.ontap, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: ListTile(
        title:  CustomText(
          text: 'Search Engine'.tr,
        ),
        subtitle: SubtitleTextWidget(
          subtitle: subtitle,
        ),
      ),
    );
  }
}
