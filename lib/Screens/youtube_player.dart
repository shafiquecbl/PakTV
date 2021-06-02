import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YPlayer extends StatefulWidget {
  final String channelURL;
  final String channelName;
  final String channelImage;
  YPlayer(
      {@required this.channelURL,
      @required this.channelName,
      @required this.channelImage});
  @override
  _YPlayerState createState() => _YPlayerState();
}

class _YPlayerState extends State<YPlayer> {
  YoutubePlayerController _controller;
  BannerAd _bannerAd;
  bool _isBannerAdReady = false;
  @override
  void initState() {
    super.initState();
    playerConfig();
    getBanner();
  }

  playerConfig() {
    _controller = YoutubePlayerController(
      initialVideoId: widget.channelURL,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
  }

  getBanner() async {
    _bannerAd = BannerAd(
      adUnitId: 'ca-app-pub-8292080667335054/2542252646', //Ad for Testing
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
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.redAccent,
      ),
      builder: (context, player) => Scaffold(
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
        body: Column(
          children: [
            player,
            _isBannerAdReady
                ? Container(
                    height: 100,
                    child: AdWidget(ad: _bannerAd),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
