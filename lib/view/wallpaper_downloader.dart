import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_downloader/components/wallpaper_button.dart';
import 'package:video_downloader/utils/InterstialAdController.dart';

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
      child: Scaffold(
        appBar: AppBar(
          title: Text('Wallpaper Downloader'.tr),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
          
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    WallpaperButton(
                      onTap: () {},
                      title: 'Flowers'.tr,
                      imageAsset:
                          'images/wallpaper_pic.png', // replace with your asset
                    ),
                    WallpaperButton(
                      onTap: () {},
                      title: 'Trending'.tr,
                      imageAsset:
                          'images/wallpaper_pic.png', // replace with your asset
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  bottom: 8.0,
                  right: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    WallpaperButton(
                      onTap: () {},
                      title: '3D'.tr,
                      imageAsset:
                          'images/wallpaper_pic.png', // replace with your asset
                    ),
                    WallpaperButton(
                      onTap: () {},
                      title: 'Anime'.tr,
                      imageAsset:
                          'images/wallpaper_pic.png', // replace with your asset
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  bottom: 8.0,
                  right: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    WallpaperButton(
                      onTap: () {},
                      title: 'Animals'.tr,
                      imageAsset:
                          'images/wallpaper_pic.png', // replace with your asset
                    ),
                    WallpaperButton(
                      onTap: () {},
                      title: 'Cars'.tr,
                      imageAsset:
                          'images/wallpaper_pic.png', // replace with your asset
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  bottom: 8.0,
                  right: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    WallpaperButton(
                      onTap: () {},
                      title: 'City'.tr,
                      imageAsset:
                          'images/wallpaper_pic.png', // replace with your asset
                    ),
                    WallpaperButton(
                      onTap: () {},
                      title: 'Minimalism'.tr,
                      imageAsset:
                          'images/wallpaper_pic.png', // replace with your asset
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
