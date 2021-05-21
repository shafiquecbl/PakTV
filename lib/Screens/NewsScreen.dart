import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Components/channelCard.dart';

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Container(
            width: 200,
            height: 45,
            decoration: BoxDecoration(
                color: Colors.blueAccent.withOpacity(0.3),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.live_tv, color: Colors.blueAccent),
                SizedBox(
                  width: 15,
                ),
                Text('News',
                    style: GoogleFonts.teko(
                      color: Colors.blueAccent,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    )),
                SizedBox(
                  width: 5,
                ),
              ],
            ),
          )),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Channels')
            .orderBy('channelName', descending: true)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(
              child: CircularProgressIndicator(),
            );
          if (snapshot.data.docs.length == 0)
            return Center(
              child: Text('No Channel Yet',
                  style: GoogleFonts.teko(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryColor == Colors.blue
                          ? Colors.black54
                          : Colors.grey[50])),
            );
          return GridView.count(
              crossAxisCount: MediaQuery.of(context).size.width > 1000 ? 4 : 2,
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
              padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
              children: List<Widget>.generate(
                  snapshot.data.docs.length,
                  (index) => ChannelCard(
                        channelName: snapshot.data.docs[index]['channelName'],
                        channelImage: snapshot.data.docs[index]['channelImage'],
                        channelURL: snapshot.data.docs[index]['channelURL'],
                      )));
        },
      ),
    );
  }
}
