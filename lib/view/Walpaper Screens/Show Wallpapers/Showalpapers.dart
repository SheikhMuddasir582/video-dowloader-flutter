import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:video_downloader/components/Gradient%20Widget/Gradient%20Wigdet.dart';
import 'package:video_downloader/utils/Walpaper%20Handler/WalpaperProvider.dart';

import '../View Walppaer/ViewWalpapers.dart'; // Assuming this is your FullscreenImage widget

class Showwalpaperscreen extends StatefulWidget {
  final String searchQuery;
  final String appbartitle;

  const Showwalpaperscreen(
      {super.key, required this.searchQuery, required this.appbartitle});

  @override
  State<Showwalpaperscreen> createState() => _ShowwalpaperscreenState();
}

class _ShowwalpaperscreenState extends State<Showwalpaperscreen> {
  @override
  void initState() {
    super.initState();
    Permission.storage.request();
    final photosProvider = Provider.of<PhotosProvider>(context, listen: false);
    photosProvider.fetchPhotos(widget.searchQuery);
  }

  @override
  Widget build(BuildContext context) {
    final photosProvider = Provider.of<PhotosProvider>(context);
    final photos = photosProvider.photos;

    return GradientColor(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          leadingWidth: 30,
          titleTextStyle: const TextStyle(
              color: Colors.white, fontFamily: 'OpenSauceOne', fontSize: 18),
          backgroundColor: Colors.teal,
          title: Text('${widget.appbartitle} Wallpapers'),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: photos.isEmpty
            ? SizedBox(
                width: Get.width * 1,
                height: Get.height * 1,
                child: Shimmer.fromColors(
                    baseColor: Colors.red,
                    highlightColor: Colors.yellow,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    )),
              )
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemCount: photos.length,
                itemBuilder: (context, index) {
                  final photo = photos[index];
                  final imageUrl = photo['src']['large2x']; // Correct path

                  return InkWell(
                    onTap: () {
                      Get.to(() => ViewFullScreenWalpaper(imageUrl: imageUrl));
                    }, // Add tap functionality as needed
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.fill, // Make image cover entire screen
                      placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.red,
                          highlightColor: Colors.yellow,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          )),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
