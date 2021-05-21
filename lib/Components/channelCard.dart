import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Screens/stream_player.dart';
import '../Screens/youtube_player.dart';

class ChannelCard extends StatelessWidget {
  final String channelName;
  final String channelImage;
  final String channelURL;
  ChannelCard(
      {@required this.channelName,
      @required this.channelImage,
      @required this.channelURL});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor == Colors.white
                ? Colors.grey[100]
                : Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(10)),
        child: TextButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => channelURL.length < 15
                        ? YPlayer(
                            channelURL: channelURL,
                            channelName: channelName,
                            channelImage: channelImage,
                          )
                        : StreamPlayer(
                            channelURL: channelURL,
                            channelName: channelName,
                            channelImage: channelImage,
                          )));
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CachedNetworkImage(
                  imageUrl: channelImage,
                  width: 50,
                  height: 50,
                  fit: BoxFit.contain,
                  placeholder: (context, url) => Icon(
                        Icons.image,
                        size: 50,
                      ),
                  errorWidget: (context, url, error) => Icon(
                        Icons.image,
                        size: 50,
                      )),
              SizedBox(
                height: 14,
              ),
              Text(
                channelName,
                style: GoogleFonts.teko(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).primaryColor == Colors.blue
                        ? Colors.black54
                        : Colors.grey[50]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
