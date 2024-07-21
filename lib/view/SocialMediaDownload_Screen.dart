import 'package:flutter/material.dart';
import 'package:video_downloader/components/SocialMediaDownloadWidget.dart';
import 'package:video_downloader/components/customAppbar.dart';

// import '../components/custom_navigation_bar.dart';

class SocialMediaDownloadScreen extends StatefulWidget {
  
  final String appbartitle;
  const SocialMediaDownloadScreen({super.key, required this.appbartitle});

  @override
  State<SocialMediaDownloadScreen> createState() =>
      _SocialMediaDownloadScreenState();
}

class _SocialMediaDownloadScreenState extends State<SocialMediaDownloadScreen> {
  final TextEditingController urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: CustomAppbar(title: widget.appbartitle),
        body: DownloaderWidget(urlController: urlController),
      ),
    );
  }
}
