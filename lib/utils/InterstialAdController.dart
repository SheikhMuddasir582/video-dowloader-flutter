import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:video_downloader/utils/checkinternet.dart';
import 'package:video_downloader/utils/checkpremium.dart';

class AdManager with WidgetsBindingObserver {
  static InterstitialAd? _interstitialAd;
  static bool _isAdLoaded = false;

  static void loadInterstitialAd() {
    if (_interstitialAd != null) {
      print('Disposing Ad');
      _interstitialAd!.dispose(); // Dispose of previous ad instance
      _interstitialAd = null;
    }
    // Fetch premium status from FirestoreService
    FirestoreService.getPremiumStatus().then((isPremium) {
      if (!isPremium && ConnectivityService.hasInternet) {
        InterstitialAd.load(
          adUnitId: 'ca-app-pub-3940256099942544/1033173712', // Test Ad Unit ID
          request: const AdRequest(),
          adLoadCallback: InterstitialAdLoadCallback(
            onAdLoaded: (ad) {
              _interstitialAd = ad;
              _isAdLoaded = true;
            },
            onAdFailedToLoad: (error) {
              print('InterstitialAd failed to load: $error');
              _isAdLoaded = false;
            },
          ),
        );
      } else {
        _isAdLoaded = false;
      }
    });
  }

  static void showInterstitialAd(
      Function() onAdDismissed, Function(bool) onAdNotLoaded) {
    if (_isAdLoaded && _interstitialAd != null) {
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          _interstitialAd = null;
          _isAdLoaded = false;
          onAdDismissed();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          _interstitialAd = null;
          _isAdLoaded = false;
          print('Failed to show interstitial ad: $error');
          onAdNotLoaded(false);
        },
      );
      _interstitialAd!.show();
    } else {
      print('InterstitialAd is not ready yet or not loaded.');
      onAdNotLoaded(false);
    }
  }

  static void disposeInterstitialAd() {
    _interstitialAd?.dispose();
    _interstitialAd = null;
    _isAdLoaded = false;
  }

  static void init() {
    WidgetsBinding.instance.addObserver(AdManager());
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.detached) {
      disposeInterstitialAd();
    }
  }
}
