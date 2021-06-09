import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paktv/Components/info_card.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

const phone = '+923458628858';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 70,
              ),
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/shafique.jpg'),
              ),
              Text('Muhammad Shafique',
                  style: GoogleFonts.pacifico(
                      fontSize: 38,
                      color: Theme.of(context).primaryColor == Colors.blue
                          ? Colors.black54
                          : Colors.white,
                      fontWeight: FontWeight.bold)),
              Text(
                'Software Engineer',
                style: GoogleFonts.sourceSansPro(
                    fontSize: 26,
                    color: Theme.of(context).primaryColor == Colors.blue
                        ? Colors.teal[200]
                        : Colors.teal[100],
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
                width: 200,
                child: Divider(
                  color: Colors.teal.shade700,
                ),
              ),
              InfoCard(
                text: 'shafiquecbl@gmail.com',
                icon: Icons.email,
                onPressed: () async {
                  final emailAddress = 'mailto:shafiquecbl@gmail.com';
                  await launcher.launch(emailAddress);
                },
              ),
              InfoCard(
                text: '+923458628858',
                icon: Icons.phone,
                onPressed: () async {
                  String removeSpaceFromPhoneNumber =
                      phone.replaceAll(new RegExp(r"\s+\b|\b\s"), "");
                  final phoneCall = 'tel:$removeSpaceFromPhoneNumber';

                  await launcher.launch(phoneCall);
                },
              ),
              InfoCard(
                text: 'Portfolio',
                icon: Icons.web,
                onPressed: () async {
                  await launcher.launch('http://shafiquecbl.000webhostapp.com');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
