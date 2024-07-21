import 'package:flutter/material.dart';
import 'package:video_downloader/utils/App%20Colors/constants.dart';

class LanguageButton extends StatelessWidget {
  final String languageCode;
  final String languageText;
  final String flagAssetPath; // Path to flag asset image
  final bool isSelected;
  final VoidCallback onTap;

  const LanguageButton({
    super.key,
    required this.languageCode,
    required this.languageText,
    required this.flagAssetPath,
    this.isSelected= false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          backgroundColor: isSelected ? Colors.grey[200] : Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
             side: isSelected ? const BorderSide(color: appColor)  : const BorderSide(color: Colors.transparent),
          ),
        ),
        child: SizedBox(
          height: 40,
          child: Row(
            children: [
              Image.asset(
                flagAssetPath,
                width: 24.0,
                height: 16.0,
                // Replace with your asset package if applicable
              ),
              const SizedBox(width: 20.0),
              Text(languageText, style: const TextStyle(color: Colors.black, fontFamily: 'OpenSauceOne',),),
              const Spacer(), // Add spacer for right alignment of dot
              Container(
                width: 15.0, // Adjust dot width as needed
                height: 25.0, // Adjust dot height as needed
                decoration: BoxDecoration(
                  border: isSelected ? Border.all(color: const Color(0xffA660DB), width: 3) : Border.all(color: Colors.transparent),
                  color: isSelected ? const Color.fromARGB(255, 136, 60, 150) : Colors.transparent,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}