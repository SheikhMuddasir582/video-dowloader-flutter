import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WhatsapppButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String mainText;
  final Color bgcolor;
  final Color textcolor;
  final String logoImg;

  const WhatsapppButton(
      {super.key,
      this.onTap,
      required this.mainText,
      required this.logoImg,
      required this.bgcolor,
      required this.textcolor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: Get.width * 0.77,
          height: Get.height * 0.065,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: bgcolor // Color(0xffFFF0D9),
              ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: Get.width * 0.035),
                child: Image.asset(
                  logoImg,
                  width: Get.width * 0.1,
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(left: Get.width * 0.03),
                  child: Text(
                    mainText,
                    style: TextStyle(
                        color: textcolor,
                        fontSize: 13,
                        fontFamily: 'OpenSauceOne',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
