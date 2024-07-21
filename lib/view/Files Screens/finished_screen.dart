import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:video_downloader/components/Buttons%20Widgets/how_to_downl.dart';
import 'package:video_downloader/view/Tutorials%20Screens/How_to_download_Screen.dart';

class FinishedScreen extends StatefulWidget {
  const FinishedScreen({super.key});

  @override
  State<FinishedScreen> createState() => _FinishedScreenState();
}

class _FinishedScreenState extends State<FinishedScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Finished'.tr),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete),
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
      ),
    );
  }
}
