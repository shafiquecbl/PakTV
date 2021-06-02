import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_admob_app_open/flutter_admob_app_open.dart';
import 'package:paktv/Screens/Home/home.dart';
import 'theme.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Replace your admob app ID
  final admobAppId = 'ca-app-pub-8292080667335054~6083904224';

  /// Replace your admob app open ad unit id
  final appAppOpenAdUnitId = 'ca-app-pub-8292080667335054/2880044433';

  AdRequestAppOpen targetingInfo = AdRequestAppOpen(
    keywords: <String>['flutterio', 'beautiful apps'],
    contentUrl: 'https://flutter.io',
    testDevices: <String>[], // Android emulators are considered test devices
    nonPersonalizedAds: true,
  );

  await FlutterAdmobAppOpen.instance.initialize(
    appId: admobAppId,
    appAppOpenAdUnitId: appAppOpenAdUnitId,
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
