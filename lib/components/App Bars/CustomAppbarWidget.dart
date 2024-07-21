import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBarWigdet extends StatelessWidget {
  final title;
  const CustomAppBarWigdet({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Get.height * 0.02, left: Get.width * 0.03),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image(
              image: const AssetImage(
                'images/backarrow.png',
              ),
              width: Get.width * 0.019,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: Get.width * 0.02),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: Get.width * 0.035,
                  color: Colors.black,
                  fontFamily: 'OpenSauceOne'),
            ),
          )
        ],
      ),
    );
  }
}
