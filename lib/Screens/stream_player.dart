import 'package:better_player/better_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class StreamPlayer extends StatefulWidget {
  final String channelURL;
  final String channelName;
  final String channelImage;
  StreamPlayer(
      {@required this.channelURL,
      @required this.channelName,
      @required this.channelImage});
  @override
  _StreamPlayerState createState() => _StreamPlayerState();
}

class _StreamPlayerState extends State<StreamPlayer> {
  BannerAd _bannerAd;
  bool _isBannerAdReady = false;

  @override
  void initState() {
    super.initState();
    _bannerAd = BannerAd(
      adUnitId: 'ca-app-pub-3940256099942544/6300978111', //Ad for Testing
      request: AdRequest(),
      size: AdSize.banner,
      listener: AdListener(
        onAdLoaded: (ad) {
          setState(() {
            _isBannerAdReady = true;
          });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: _isBannerAdReady
      //     ? Container(
      //         child: AdWidget(ad: _bannerAd),
      //       )
      //     : Container(),
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Container(
            width: 200,
            height: 45,
            decoration: BoxDecoration(
                color: Colors.blueAccent.withOpacity(0.3),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CachedNetworkImage(
                    imageUrl: widget.channelImage,
                    width: 25,
                    height: 25,
                    fit: BoxFit.contain,
                    placeholder: (context, url) => Icon(
                          Icons.image,
                          size: 25,
                        ),
                    errorWidget: (context, url, error) => Icon(
                          Icons.image,
                          size: 50,
                        )),
                SizedBox(
                  width: 15,
                ),
                Text(widget.channelName,
                    style: GoogleFonts.teko(
                      color: Theme.of(context).primaryColor == Colors.blue
                          ? Colors.black54
                          : Colors.grey[50],
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    )),
                SizedBox(
                  width: 5,
                ),
              ],
            ),
          )),
      body: Container(
        color: Color(0xFF303030),
        child: Column(
          children: [
            Center(
                child: BetterPlayer.network(widget.channelURL,
                    betterPlayerConfiguration: BetterPlayerConfiguration(
                      aspectRatio: 16 / 9,
                      autoDetectFullscreenDeviceOrientation: true,
                      autoPlay: true,
                    ))),
          ],
        ),
      ),
    );
  }
}
