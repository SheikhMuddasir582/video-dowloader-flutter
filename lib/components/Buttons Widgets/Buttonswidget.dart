// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class RoundButton extends StatelessWidget {
  bool loading = false;
  final String title;
  final VoidCallback ontap;

  RoundButton(
      {super.key,
      required this.title,
      required this.ontap,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
          width: MediaQuery.of(context).size.width * .89,
          height: MediaQuery.of(context).size.height * .056,
          decoration: BoxDecoration(
              color: HexColor('A660DB'),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: loading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                    ),
                  )
                : Text(title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * .038,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSauceOne')),
          )),
    );
  }
}
