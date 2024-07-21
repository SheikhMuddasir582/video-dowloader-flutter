import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_downloader/utils/App%20Colors/constants.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final VoidCallback? onrefresh;
  final VoidCallback? onSettings;
  final VoidCallback? onBack;
  final VoidCallback? onForward;
  final VoidCallback? onMenu;

  const CustomSearchBar({
    super.key,
    this.controller,
    this.onrefresh,
    this.onSettings,
    this.onBack,
    this.onForward,
    this.onMenu,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController Urlcontroller = TextEditingController();
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
          top: h * 0.005, bottom: h * 0.027, left: w * 0.025, right: w * 0.02),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: appColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: w * 0.009, left: w * 0.009),
              child: SizedBox(
                width: w * .04,
                height: h * .05,
                child: const Center(
                    child: Image(image: AssetImage('images/2.png'))),
              ),
            ),
            SizedBox(
                width: w * .50,
                height: h * 0.04,
                child: Center(
                  child: TextField(
                    controller: Urlcontroller,
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: InkWell(
                          onTap: onrefresh,
                          child: Icon(
                            Icons.refresh,
                            color: Colors.grey,
                            size: w * 0.05,
                          ),
                        )),
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(right: w * 0.02, left: w * 0.02),
              child: InkWell(
                onTap: onSettings,
                child: SizedBox(
                  width: w * .04,
                  height: h * .05,
                  child: const Center(
                      child: Icon(
                    Icons.settings,
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
            Padding(
              padding: EdgeInsets.only(left: w * 0.02),
              child: PopupMenuButton<String>(
                iconSize: w * 0.05,
                icon: const Icon(Icons.more_vert, color: Colors.white),
                onSelected: (String result) {
                  // Handle the menu selection
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'Option 1',
                    child: Text('Option 1'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Option 2',
                    child: Text('Option 2'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




// 