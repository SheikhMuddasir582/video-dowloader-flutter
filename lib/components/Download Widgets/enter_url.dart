
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_downloader/utils/App%20Colors/constants.dart';

class EnterUrl extends StatelessWidget {
  final VoidCallback onTap;
  final TextEditingController? controller;

  const EnterUrl({super.key, required this.onTap, required this.controller});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        padding: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 10.0,
        ),
        decoration: BoxDecoration(
          color: vsColor,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Enter Url here'.tr,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Enter user name or paste profile URL'.tr,
                  prefixIcon: const Icon(Icons.link),
                  isDense: true,
                  contentPadding: const EdgeInsets.all(8.0)),
            ),
          ],
        ),
      ),
    );
  }
}
