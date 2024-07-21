import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:video_downloader/utils/constants.dart';
import 'package:video_downloader/view/exit.dart';
import 'package:video_downloader/view/finished_screen.dart';
import 'package:video_downloader/view/home_screen.dart';
import 'package:video_downloader/view/progress_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  DateTime btime = DateTime.now();
  final _controller = PersistentTabController(initialIndex: 0);

  List<Widget> screens() {
    return [
      const HomeScreen(),
      const ProgressScreen(),
      const FinishedScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> navBarItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.tab),
        title: 'Tab'.tr,
        activeColorPrimary: appColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.autorenew),
        title: 'Progress'.tr,
        activeColorPrimary: appColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.folder),
        title: 'Folder'.tr,
        activeColorPrimary: appColor,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        final currentTime = DateTime.now();
        if (currentTime.difference(btime) > const Duration(seconds: 3)) {
          Fluttertoast.showToast(
              msg: 'Tap Again to Exit', toastLength: Toast.LENGTH_SHORT);
          btime = currentTime;
        } else {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const ExitScreen())));
        }
      },
      child: PersistentTabView(
        context,
        screens: screens(),
        items: navBarItems(),
        controller: _controller,
        navBarStyle: NavBarStyle.style6,
        popAllScreensOnTapAnyTabs: true,
      ),
    );
  }
}
