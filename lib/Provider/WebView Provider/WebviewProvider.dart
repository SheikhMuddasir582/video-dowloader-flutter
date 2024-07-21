import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:video_downloader/Provider/Download%20Providers/Downloadprovider.dart';

class WebViewProvider extends ChangeNotifier {
  final TextEditingController searchController = TextEditingController();
  double _webProgress = 0.0;
  bool validurl = false;
  bool _isloading = false;
  bool _isTyping = false;
  String _search = '';
  String _downloadUrl = '';
  InAppWebViewController? webController;
  VideoDownloadProvider? downloadProvider; // Access to download provider
  double get webProgress => _webProgress;
  bool get isTyping => _isTyping;
  bool get isloading => _isloading;
  String get search => _search;
  String get downloadUrl => _downloadUrl;
  PullToRefreshController? ptocontroller;
  final bool _isValidUrl = false;
  TextEditingController get getSearchController => searchController;
  void initializePullToRefreshController() {
    ptocontroller = PullToRefreshController(
      onRefresh: () async {
        webController!.reload();
        _isloading = true; // Reset loading state
        ptocontroller!.endRefreshing();
        notifyListeners(); // Notify about changes
      },
      settings: PullToRefreshSettings(
        color: Colors.white,
        backgroundColor: Colors.black,
      ),
    );
  }

  // Getters (you might not need these if directly accessing values in the UI)

  void disposeController() {
    ptocontroller?.dispose();
    ptocontroller = null;
    webController?.stopLoading();
    webController = null;
  }

  void closetab(BuildContext context) {
    notifyListeners();
    _isloading = false;
    webController!.stopLoading();
    Navigator.pop(context);
    disposeController();
  }

  void setSearch(String value) {
    _search = value;
    notifyListeners();
  }

  void onsuggestiontap(BuildContext context) {
    notifyListeners();
    Getsearch(_search);
    _isTyping = false;
    FocusScope.of(context).unfocus();
    webController!.loadUrl(urlRequest: URLRequest(url: Getsearch(_search)));
  }

  void setDownloadUrl(String url) {
    _downloadUrl = url;
    notifyListeners();
  }

  //  Functions for Websearchbar and Webview actions
  void ondownload() {
    GetcurrentUrl();
  }

  void onStoploading() {
    GetcurrentUrl();
    notifyListeners();
    _isloading = false;
    webController!.stopLoading();
  }

  void onremovetext() {
    setSearch('');
    searchController.text = '';
  }

  void onChanged(String value) {
    _search = value;
    _isTyping = true;
    notifyListeners();
  }

  void onsubmit(String value, BuildContext context) {
    FocusScope.of(context).unfocus();
    _isTyping = false;
    notifyListeners();
    webController!.loadUrl(urlRequest: URLRequest(url: Getsearch(value)));
  }

  void onBack() {
    webController!.goBack();
  }

  void onForward(BuildContext context) {
    FocusScope.of(context).unfocus();
    webController!.goForward();
  }

  void onrefresh(BuildContext context) {
    GetcurrentUrl();
    FocusScope.of(context).unfocus();
    webController!.reload();
  }

  Future<void> GetcurrentUrl() async {
    Uri? webUri = await webController!.getUrl();
    setDownloadUrl(webUri.toString());
  }

  void onprogresschanged(int progress) {
    GetcurrentUrl();
    notifyListeners();
    _isloading = true;
    notifyListeners();
    _webProgress = progress / 100;
  }

  void Onloadingstarted(WebUri url, BuildContext context) {
    GetcurrentUrl();
    notifyListeners();
    _isloading = true;
    _isTyping = false;
    searchController.text = url.toString();
    FocusScope.of(context).unfocus();
  }

  void onloadingstopped() {
    notifyListeners();
    _isloading = false;
  }

  WebUri getInitialUri(String web) {
    if (validurl ||
        web.contains('http') ||
        web.contains('www') ||
        web.contains('.com')) {
      return WebUri(web);
    } else {
      return WebUri(
          'https://www.google.com/search?q=${Uri.encodeQueryComponent(web)}');
    }
  }

  Future<void> checkurl(String urlcheck) async {
    try {
      final result = await InternetAddress.lookup(urlcheck);
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        validurl = true;
      } else {
        validurl = false;
      }
    } on SocketException catch (_) {
      validurl = false;
    }
  }

  WebUri Getsearch(String url) {
    if (validurl ||
        url.contains('http') ||
        url.contains('www') ||
        url.contains('.com')) {
      return WebUri(url);
    } else {
      return WebUri(
          'https://www.google.com/search?q=${Uri.encodeQueryComponent(url)}');
    }
  }

  void showstorydialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Download Story'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Download')),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'))
          ],
        );
      },
    );
  }
}
