import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class GetAd extends ChangeNotifier {
  BannerAd _bannerAd;
  bool _isBannerAdReady = false;

  BannerAd getBannerAd() => _bannerAd;
  bool isBannerReady() => _isBannerAdReady;

  getBanner() async {
    _bannerAd = BannerAd(
      adUnitId: 'ca-app-pub-3940256099942544/6300978111',
      request: AdRequest(),
      size: AdSize.banner,
      listener: AdListener(
        onAdLoaded: (ad) {
          _isBannerAdReady = true;
          notifyListeners();
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          _isBannerAdReady = false;
          ad.dispose();
        },
      ),
    );
    _bannerAd.load();
  }
}
