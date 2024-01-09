
import 'package:app_mobile/pages/home_page.dart';
import 'package:app_mobile/pages/login_page.dart';
import 'package:app_mobile/pages/onboarding1_page.dart';
import 'package:app_mobile/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        body: const HomePage(),
      ),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => LoginPage(),
        '/register': (BuildContext context) => RegisterPage(),
        '/home': (BuildContext context) => HomePage(),
      },
    );
  }
}

