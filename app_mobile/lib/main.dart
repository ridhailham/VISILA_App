
import 'dart:convert';

import 'package:app_mobile/ProductDataModel.dart';
import 'package:app_mobile/pages/cam_page.dart';
import 'package:app_mobile/pages/home_page.dart';
import 'package:app_mobile/pages/listen_page.dart';
import 'package:app_mobile/pages/login_page.dart';

import 'package:app_mobile/pages/bantuan_page.dart';
import 'package:app_mobile/pages/news_page.dart';
import 'package:app_mobile/pages/onboarding1_page.dart';
import 'package:app_mobile/pages/profile_page.dart';
import 'package:app_mobile/pages/read_page.dart';
import 'package:app_mobile/pages/register_page.dart';
import 'package:app_mobile/pages/speech_page.dart';
import 'package:app_mobile/pages/splash_page.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:flutter/services.dart' as rootBundle;

late List<CameraDescription> cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text("Welcome.", textAlign: TextAlign.end, style: TextStyle(fontSize: 30, fontWeight: bold)),

        // )

        body: SplashPage(),
      ),


      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => LoginPage(),
        '/register': (BuildContext context) => RegisterPage(),
        '/home': (BuildContext context) => HomePage(),
        '/listen':(BuildContext context) => ListenPage(),
        '/read':(BuildContext context) => ReadPage(),
        '/camera' : (BuildContext context) => CameraPage(),
        '/profile' : (BuildContext context) => ProfilePage(),
        '/bantuan' : (BuildContext context) => BantuanPage(),
        '/news' : (BuildContext context) => NewsPage(),
      },
    );
  }

  
}


