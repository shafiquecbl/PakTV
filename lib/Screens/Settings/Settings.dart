import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paktv/Screens/Settings/Profile/profile.dart';
import 'package:paktv/Screens/Settings/Web%20View/web_view.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;
import 'package:share/share.dart';

class Setting extends StatefulWidget {
  final String link;
  Setting({@required this.link});
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    Color myColor = Theme.of(context).primaryColor == Colors.blue
        ? Colors.black54
        : Colors.grey[50];
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text('More',
              style: GoogleFonts.teko(
                color: myColor,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ))),
      body: ListView(
        children: [
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(15),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (builder) => PrivacyPolicy(
                            title: 'Privacy Policy',
                            url: 'https://paktv.flycricket.io/privacy.html',
                          )));
            },
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Privacy Policy',
                style: TextStyle(fontSize: 14, color: myColor),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 19),
            child: Divider(
              height: 1,
              thickness: 1.5,
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(15),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => ProfilePage()));
            },
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'About Us',
                style: TextStyle(fontSize: 14, color: myColor),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 19),
            child: Divider(
              height: 1,
              thickness: 1.5,
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(15),
            ),
            onPressed: () async {
              await launcher.launch('http://shafiquecbl.000webhostapp.com');
            },
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Contact Us',
                style: TextStyle(fontSize: 14, color: myColor),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 19),
            child: Divider(
              height: 1,
              thickness: 1.5,
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(15),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (builder) => PrivacyPolicy(
                            title: 'Terms & Conditions',
                            url: 'https://paktv.flycricket.io/terms.html',
                          )));
            },
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Terms & Conditions',
                style: TextStyle(fontSize: 14, color: myColor),
              ),
            ),
          ),
          if (widget.link != "")
            Padding(
              padding: const EdgeInsets.only(left: 19),
              child: Divider(
                height: 1,
                thickness: 1.5,
              ),
            ),
          if (widget.link != "")
            TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.all(15),
              ),
              onPressed: () async {
                _onShare(context);
              },
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Share this App',
                  style: TextStyle(fontSize: 14, color: myColor),
                ),
              ),
            ),
          if (widget.link != "")
            Padding(
              padding: const EdgeInsets.only(left: 19),
              child: Divider(
                height: 1,
                thickness: 1.5,
              ),
            ),
          if (widget.link != "")
            TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.all(15),
              ),
              onPressed: () async {
                await launcher.launch(widget.link);
              },
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Rate this App',
                  style: TextStyle(fontSize: 14, color: myColor),
                ),
              ),
            ),
        ],
      ),
    );
  }

  _onShare(BuildContext context) async {
    final RenderBox box = context.findRenderObject() as RenderBox;
    await Share.share(widget.link,
        subject: 'Download this amazing app to watch Live News',
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }
}
