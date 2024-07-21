import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:video_downloader/components/how_to_downl.dart';
import 'package:video_downloader/view/How_to_download_Screen.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
// int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Progress'.tr),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit_document),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: size.width * 0.3,
                right: size.width * 0.3,
                top: size.width * 0.5), // Responsive padding
            child: Center(child: Text('No History'.tr)),
          ),
          HowToDownloadButton(
            onTap: () {
              PersistentNavBarNavigator.pushNewScreen(
                context,
                screen: const HowtoDownloadScreen(),
                withNavBar: false,
              );
            },
          ),
        ],
      ),
    );
  }
}
