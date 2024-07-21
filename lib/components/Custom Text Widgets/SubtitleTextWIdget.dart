import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubtitleTextWidget extends StatelessWidget {
 final String subtitle;
  const SubtitleTextWidget({super.key, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      style: GoogleFonts.aBeeZee(
        textStyle: TextStyle(
          fontSize: MediaQuery.of(context).size.width * 0.03,
          fontWeight: FontWeight.w600,
          color: Colors.black38,
        ),
      ),
    );
  }
}
