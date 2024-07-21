import'package:flutter/material.dart';
import 'package:video_downloader/utils/App%20Colors/constants.dart';

class PasteButton extends StatelessWidget {
final String title;
final VoidCallback onTap;

  const PasteButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
          width: size.width * 0.45,
          child: GestureDetector(
            onTap: onTap,
            child: ElevatedButton(
              onPressed: () {
                // Implement search functionality
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: appColor ,
                // primary: Colors.purple,
                // padding: EdgeInsets.symmetric(vertical: 20.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text(
               title,
                style: const TextStyle(fontSize: 18.0, color: Colors.white),
              ),
            ),
          ),
        );
  }
}