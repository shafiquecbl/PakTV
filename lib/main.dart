import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_admob_app_open/flutter_admob_app_open.dart';
import 'package:paktv/Screens/Home/home.dart';
import 'Components/adID.dart';
import 'theme.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  AdRequestAppOpen targetingInfo = AdRequestAppOpen(
    keywords: <String>['flutterio', 'beautiful apps'],
    contentUrl: 'https://flutter.io',
    testDevices: <String>[], // Android emulators are considered test devices
    nonPersonalizedAds: true,
  );

  await FlutterAdmobAppOpen.instance.initialize(
    appId: admobAppId,
    appAppOpenAdUnitId: adUnitID,
    targetingInfo: targetingInfo,
  );

  MobileAds.instance.initialize();
  await Firebase.initializeApp().then((value) {
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

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
