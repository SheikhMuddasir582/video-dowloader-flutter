import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';
import 'package:video_downloader/Provider/Download%20Providers/Downloadprovider.dart';
import 'package:video_downloader/Provider/WebView%20Provider/WebviewProvider.dart';
import 'package:video_downloader/components/Search%20Bar/Websearchbar.dart';

class WebviewScreen extends StatefulWidget {
  final String web;
  const WebviewScreen({super.key, required this.web});

  @override
  _WebviewScreenState createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  ChromeSafariBrowser browser = ChromeSafariBrowser();
  final List<InAppWebViewController> _webViewsControllers = [];

  @override
  void initState() {
    super.initState();

    context.read<WebViewProvider>().initializePullToRefreshController();
  }

  @override
  Widget build(BuildContext context) {
    final downloadprovider = Provider.of<VideoDownloadProvider>(context);
    return PopScope(
        canPop: false,
        onPopInvoked: (didPop) {},
        child: SafeArea(
          child: Consumer<WebViewProvider>(
            builder: (context, Provider, child) {
              return Scaffold(
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    Provider.GetcurrentUrl();
                    downloadprovider.downloadVideo(
                        context, Provider.downloadUrl);
                  },
                  child: downloadprovider.isDownloading
                      ? SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(
                            color: Colors.red,
                            backgroundColor: Colors.black,
                            value: downloadprovider.downloadProgress,
                            strokeWidth: 3,
                          ),
                        )
                      : const Icon(Icons.download),
                ),
                body: Column(
                  children: [
                    Websearchbar(
                      onclosetab: () {
                        print('tapped');
                        Provider.closetab(context);
                      },
                      onChanged: (value) {
                        Provider.onChanged(value);
                      },
                      onsubmit: (value) {
                        Provider.onsubmit(value, context);
                      },
                      controller: Provider.searchController,
                      onBack: () {
                        Provider.onBack();
                      },
                      onForward: () {
                        Provider.onForward(context);
                      },
                      onStoploading: () {
                        Provider.onStoploading();
                      },
                      ondownload: () {},
                      onrefresh: () {
                        Provider.onrefresh(context);
                      },
                      onremovetext: () {
                        Provider.onremovetext();
                      },
                    ),
                    if (Provider.isloading)
                      LinearProgressIndicator(
                        value: Provider.webProgress,
                      ),
                    if (Provider.isTyping &&
                        Provider.searchController.text.isNotEmpty)
                      SizedBox(
                        child: ListTile(
                          minLeadingWidth: -5,
                          titleTextStyle: const TextStyle(
                              fontSize: 14, color: Colors.black),
                          onTap: () {
                            Provider.onsuggestiontap(context);
                          },
                          title: Text(Provider.search),
                          leading: IconButton(
                              onPressed: () {
                                Provider.onsuggestiontap(context);
                              },
                              icon: const Icon(Icons.search)),
                          trailing: IconButton(
                              onPressed: () {
                                Provider.onremovetext();
                              },
                              icon: const Icon(Icons.delete)),
                        ),
                      ),
                    Expanded(
                      child: InAppWebView(
                        onRequestFocus: (controller) {
                          print("focused");
                        },
                        onUpdateVisitedHistory: (controller, url, isReload) {
                          // Provider.GetcurrentUrl();
                          // if (url.toString().contains('stories')) {
                          //   downloadprovider.Storydown(url.toString());
                          // }
                        },
                        onTitleChanged: (controller, title) {},
                        onEnterFullscreen: (controller) {},
                        onLoadStop: (controller, url) {
                          Provider.onloadingstopped();
                        },
                        onWebViewCreated: (controller) {
                          Provider.webController = controller;
                          controller.setSettings(
                              settings: InAppWebViewSettings(
                            supportMultipleWindows: true,
                            preferredContentMode:
                                UserPreferredContentMode.MOBILE,
                            iframeAllowFullscreen: false,
                          ));
                        },
                        onProgressChanged: (controller, progress) {
                          Provider.GetcurrentUrl();

                          Provider.onprogresschanged(progress);
                        },
                        pullToRefreshController: Provider.ptocontroller,
                        onLoadStart: (controller, url) {
                          if (mounted) {
                            Provider.Onloadingstarted(url!, context);
                          }
                        },
                        initialUrlRequest: URLRequest(
                            url: Provider.getInitialUri(
                                'https://www.google.com')),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ));
  }

  void _createNewTab() async {
    await browser.open(url: WebUri('https://google.com'));
    setState(() {
      _webViewsControllers.add(InAppWebViewController.fromPlatform(
          platform: PlatformInAppWebViewController.static()));
    });
  }
}
