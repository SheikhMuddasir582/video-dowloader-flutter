import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class RoundButton extends StatelessWidget {
  final title;
  final VoidCallback ontap;

  const RoundButton({
    super.key,
    required this.title,
    required this.ontap,
  });

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
            child: Text(title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * .038,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSauceOne')),
          )),
    );
  }
}
