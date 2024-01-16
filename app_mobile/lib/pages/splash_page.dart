import 'package:app_mobile/constants.dart';
import 'package:app_mobile/pages/home_page.dart';
import 'package:app_mobile/pages/onboarding1_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> 
with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 2), () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => const OnBoardingScreen1(),
        )
      );
    });
  }


  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white
          // gradient: LinearGradient(
          //   colors: [Colors.blue, Colors.purple],
          //   begin: Alignment.topRight,
          //   end: Alignment.bottomLeft,
          // ),
        ),
        child: Container(
          margin: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children:  [
              Spacer(),
              Image.asset("animations/visila1.png"),
              // Icon(
              //   Icons.edit,
              //   size: 80,
              //   color: Colors.white,
              // ),
              SizedBox(height: 20),
              Text(
                'Equality in your hand', 
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.blue,
                  fontSize: 25,
                )
              ),
              Spacer(),
              Text(
                'by VISILA Team',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: bold
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}