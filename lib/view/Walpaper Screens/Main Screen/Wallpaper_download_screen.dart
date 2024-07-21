import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_downloader/components/App%20Bars/CustomAppbarWidget.dart';
import 'package:video_downloader/components/Buttons%20Widgets/wallpaper_button.dart';
import 'package:video_downloader/components/Gradient%20Widget/Gradient%20Wigdet.dart';
import 'package:video_downloader/components/Spacing%20Widget/SpacingWidget.dart';
import 'package:video_downloader/view/Walpaper%20Screens/Show%20Wallpapers/Showalpapers.dart';

class WallpaperDownloaderScreen extends StatefulWidget {
  const WallpaperDownloaderScreen({super.key});

  @override
  State<WallpaperDownloaderScreen> createState() =>
      _WallpaperDownloaderScreenState();
}

class _WallpaperDownloaderScreenState extends State<WallpaperDownloaderScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: SafeArea(
        child: GradientColor(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: CustomAppBarWigdet(title: 'Wallpaper Downloader'.tr),
                  ),
                  SpacingWidget(children: [
                    WallpaperButton(
                      onTap: () {
                        Get.to(() => Showwalpaperscreen(
                              appbartitle: 'Flowers'.tr,
                              searchQuery: 'Flowers',
                            ));
                      },
                      title: 'Flowers'.tr,
                      imageAsset:
                          'images/wallpaper_pic.png', // replace with your asset
                    ),
                    WallpaperButton(
                      onTap: () {
                        Get.to(() => Showwalpaperscreen(
                              appbartitle: 'Trending'.tr,
                              searchQuery: 'Trending',
                            ));
                      },
                      title: 'Trending'.tr,
                      imageAsset:
                          'images/trending.jpg', // replace with your asset
                    ),
                  ]),
                  SpacingWidget(children: [
                    WallpaperButton(
                      onTap: () {
                        Get.to(() => Showwalpaperscreen(
                              appbartitle: '3D'.tr,
                              searchQuery: '3D',
                            ));
                      },
                      title: '3D'.tr,
                      imageAsset: 'images/3d.jpg', // replace with your asset
                    ),
                    WallpaperButton(
                      onTap: () {
                        Get.to(() => Showwalpaperscreen(
                              appbartitle: 'Anime'.tr,
                              searchQuery: 'Cartoons',
                            ));
                      },
                      title: 'Anime'.tr,
                      imageAsset: 'images/anime.jpg', // replace with your asset
                    ),
                  ]),
                  SpacingWidget(children: [
                    WallpaperButton(
                      onTap: () {
                        Get.to(() => Showwalpaperscreen(
                              appbartitle: 'Animals'.tr,
                              searchQuery: 'Animals',
                            ));
                      },
                      title: 'Animals'.tr,
                      imageAsset: 'images/lion.jpg', // replace with your asset
                    ),
                    WallpaperButton(
                      onTap: () {
                        Get.to(() => Showwalpaperscreen(
                              appbartitle: 'Cars'.tr,
                              searchQuery: 'Cars',
                            ));
                      },
                      title: 'Cars'.tr,
                      imageAsset: 'images/cars.jpg', // replace with your asset
                    ),
                  ]),
                  SpacingWidget(
                    children: [
                      WallpaperButton(
                        onTap: () {
                          Get.to(() => Showwalpaperscreen(
                                appbartitle: 'City'.tr,
                                searchQuery: 'City',
                              ));
                        },

                        title: 'City'.tr,
                        imageAsset:
                            'images/city.jpg', // replace with your asset
                      ),
                      WallpaperButton(
                        onTap: () {
                          Get.to(() => Showwalpaperscreen(
                                appbartitle: 'Minimalism'.tr,
                                searchQuery: 'Minimalism',
                              ));
                        },
                        title: 'Minimalism'.tr,
                        imageAsset:
                            'images/mini.jpg', // replace with your asset
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
