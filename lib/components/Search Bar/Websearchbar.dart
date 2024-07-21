import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_downloader/utils/App%20Colors/constants.dart';

class Websearchbar extends StatelessWidget {
  final TextEditingController? controller;
  final VoidCallback? onrefresh;
  final VoidCallback? onStoploading;
  final VoidCallback? onBack;
  final VoidCallback? onForward;
  final VoidCallback? ondownload;
  final VoidCallback? onclosetab;
  final VoidCallback? onMenu;
  final VoidCallback? onremovetext;
  final void Function(String value) onChanged;
  final void Function(String value) onsubmit;

  const Websearchbar({
    super.key,
    this.controller,
    this.onrefresh,
    this.onclosetab,
    this.onStoploading,
    this.onBack,
    this.onForward,
    this.ondownload,
    this.onMenu,
    this.onremovetext,
    required this.onChanged,
    required this.onsubmit,
  });

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      height: h * 0.07,
      width: Get.width * 1,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
        color: appColor,
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: w * 0.009, left: w * 0.009),
            child: SizedBox(
              width: w * .04,
              height: h * .05,
              child:
                  const Center(child: Image(image: AssetImage('images/2.png'))),
            ),
          ),
          SizedBox(
              width: w * .50,
              height: h * 0.04,
              child: Center(
                child: TextField(
                  onSubmitted: onsubmit,
                  onChanged: onChanged,
                  controller: controller,
                  textAlignVertical: TextAlignVertical.center,
                  style: TextStyle(fontSize: w * 0.03),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: h * 0.007,
                          right: h * 0.007,
                          top: h * 0.001,
                          bottom: h * 0.001),
                      hintStyle:
                          TextStyle(fontSize: w * 0.03, color: Colors.grey),
                      hintText: 'Search or paste profile URL'.tr,
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: InkWell(
                        onTap: onremovetext,
                        child: Icon(
                          Icons.remove_circle_outline,
                          color: Colors.grey,
                          size: w * 0.05,
                        ),
                      )),
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 4, right: 5),
            child: InkWell(
              onTap: onrefresh,
              child: SizedBox(
                width: w * .04,
                height: h * .05,
                child: const Center(
                    child: Icon(
                  Icons.refresh,
                  color: Colors.white,
                )),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: w * 0.02, left: w * 0.02),
            child: InkWell(
              onTap: onStoploading,
              child: SizedBox(
                width: w * .04,
                height: h * .05,
                child: const Center(
                    child: Icon(
                  Icons.close,
                  color: Colors.white,
                )),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: w * 0.02, left: w * 0.02),
            child: InkWell(
              onTap: onBack,
              child: SizedBox(
                width: w * .04,
                height: h * .05,
                child: Center(
                    child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: w * 0.05,
                )),
              ),
            ),
          ),
          InkWell(
            onTap: onForward,
            child: SizedBox(
              width: w * .04,
              height: h * .05,
              child: Center(
                  child: Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: w * 0.05,
              )),
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.only(left: w * 0.01),
          //   child: InkWell(
          //     onTap: ondownload,
          //     child: SizedBox(
          //       width: w * .04,
          //       height: h * .05,
          //       child: Center(
          //           child: Icon(
          //         Icons.download,
          //         color: Colors.white,
          //         size: w * 0.05,
          //       )),
          //     ),
          //   ),
          // ),
          Padding(
            padding: EdgeInsets.only(left: w * 0.075),
            child: InkWell(
              onTap: onclosetab,
              child: SizedBox(
                width: w * .04,
                height: h * .05,
                child: Center(
                    child: Icon(
                  Icons.exit_to_app,
                  color: Colors.white,
                  size: w * 0.05,
                )),
              ),
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.only(left: w * 0.005),
          //   child: PopupMenuButton<String>(
          //     iconSize: w * 0.05,
          //     icon: const Icon(Icons.more_vert, color: Colors.white),
          //     onSelected: (String result) {
          //       // Handle the menu selection
          //     },
          //     itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          //       const PopupMenuItem<String>(
          //         value: 'Option 1',
          //         child: Text('Option 1'),
          //       ),
          //       const PopupMenuItem<String>(
          //         value: 'Option 2',
          //         child: Text('Option 2'),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}




// 