import 'package:flutter/material.dart';
import 'package:video_downloader/components/CustomTextWidget.dart';


class TextButtonsWidget extends StatelessWidget {
  VoidCallback ontap;
  String ButtonText;
  TextButtonsWidget({super.key, required this.ButtonText, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: ListTile(title: CustomText(text: ButtonText)),
    );
  }
}
