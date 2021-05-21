import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:paktv/Screens/Home/home.dart';
import 'theme.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await Firebase.initializeApp().then((value) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'PakTV',
        debugShowCheckedModeBanner: false,
        theme: theme(),
        darkTheme: ThemeData.dark(),
        home: HomePage());
  }
}
