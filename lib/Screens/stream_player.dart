import 'package:better_player/better_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  BetterPlayerController _controller;

  @override
  void initState() {
    playerConfig();
    // var getAd = Provider.of<GetAd>(context, listen: false);
    // getAd.getBanner();
    super.initState();
  }

  playerConfig() {
    BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.network, widget.channelURL,
        liveStream: true);
    _controller = BetterPlayerController(
        BetterPlayerConfiguration(
          looping: false,
          aspectRatio: 16 / 9,
          autoDetectFullscreenDeviceOrientation: true,
          autoPlay: true,
        ),
        betterPlayerDataSource: betterPlayerDataSource);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          BetterPlayer(
            controller: _controller,
          ),
        ],
      ),
      // bottomNavigationBar: Consumer<GetAd>(builder: (context, data, child) {
      //   return data.isBannerReady()
      //       ? Container(
      //           height: 100,
      //           child: AdWidget(ad: data.getBannerAd()),
      //         )
      //       : Container();
      // }),
    );
  }
}
