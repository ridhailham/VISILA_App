import 'package:animate_do/animate_do.dart';
import 'package:app_mobile/constants.dart';
import 'package:app_mobile/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnBoardingScreen1 extends StatefulWidget {
  const OnBoardingScreen1({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen1> {
  late PageController pageController;
  int currIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    pageController = PageController(initialPage: currIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final availHeight = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top;
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
          child: PageView(
        onPageChanged: (page) {
          setState(() {
            currIndex = page;
          });
        },
        controller: pageController,
        children: [
          PageOneWidget(
              availHeight: availHeight, pageController: pageController),
          PageTwoWidget(
              availHeight: availHeight, pageController: pageController),
          PageThreeWidget(
              availHeight: availHeight, pageController: pageController),
        ],
      )),
    );
  }
}

class PageOneWidget extends StatelessWidget {
  const PageOneWidget({
    super.key,
    required this.availHeight,
    required this.pageController,
  });

  final double availHeight;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: availHeight,
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Spacer(),
        Center(
          child: FadeOut(
            child: Lottie.asset('animations/robot.json',
                height: 350, reverse: true, repeat: true, fit: BoxFit.cover),
          ),
        ),
        Center(
          child: FadeInDown(
              delay: Duration(milliseconds: 500),
              child: Text(
                "Easy step to use!",
                style: TextStyle(
                    fontWeight: bold,
                    fontSize: MediaQuery.of(context).size.width * 0.1),
                textAlign: TextAlign.center,
              )),
        ),
        Center(
          child: FadeInDown(
              delay: Duration(milliseconds: 750),
              child: Text(
                "Experience the ease of use",
                style: TextStyle(
                  // fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * 0.06,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              )),
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const Spacer(),
            FadeInDown(
              delay: Duration(
                seconds: 1,
              ),
              child: SizedBox(
                height: 60,
                width: MediaQuery.of(context).size.width * 0.64,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: Colors.white,
                      elevation: 0,
                      side: BorderSide(color: Colors.black)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Selanjutnya",
                        style: TextStyle(fontSize: 27, color: Colors.black),
                      ),
                      // SizedBox(width: 5,),
                      Icon(
                        Icons.keyboard_double_arrow_right,
                        color: Colors.black,
                        size: 45,
                      )
                    ],
                  ),
                  onPressed: () {
                    pageController.animateToPage(1,
                        duration: Duration(milliseconds: 550),
                        curve: Curves.ease);
                  },
                ),
              ),
            ),
          ],
        ),
        const Spacer(),
      ]),
    );
  }
}

class PageTwoWidget extends StatelessWidget {
  const PageTwoWidget({
    super.key,
    required this.availHeight,
    required this.pageController,
  });

  final double availHeight;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: availHeight,
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Spacer(),
        Center(
          child: FadeOut(
            child: Lottie.asset('animations/empowering.json',
                height: 350, reverse: true, repeat: true, fit: BoxFit.cover),
          ),
        ),
        Center(
          child: FadeInDown(
              delay: Duration(milliseconds: 500),
              child: Text(
                "Empowering Equality",
                style: TextStyle(
                    fontWeight: bold,
                    fontSize: MediaQuery.of(context).size.width * 0.1),
                textAlign: TextAlign.center,
              )),
        ),
        Center(
          child: FadeInDown(
              delay: Duration(milliseconds: 750),
              child: Text(
                "Support inclusivity for a better sustainable life",
                style: TextStyle(
                  // fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * 0.06,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              )),
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const Spacer(),
            FadeInDown(
              delay: Duration(
                seconds: 1,
              ),
              child: SizedBox(
                height: 60,
                width: MediaQuery.of(context).size.width * 0.64,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: Colors.white,
                      elevation: 0,
                      side: BorderSide(color: Colors.black)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Selanjutnya",
                        style: TextStyle(fontSize: 27, color: Colors.black),
                      ),
                      // SizedBox(width: 5,),
                      Icon(
                        Icons.keyboard_double_arrow_right,
                        color: Colors.black,
                        size: 45,
                      )
                    ],
                  ),
                  onPressed: () {
                    pageController.animateToPage(2,
                        duration: Duration(milliseconds: 550),
                        curve: Curves.ease);
                  },
                ),
              ),
            ),
          ],
        ),
        const Spacer(),
      ]),
    );
  }
}

class PageThreeWidget extends StatelessWidget {
  const PageThreeWidget({
    super.key,
    required this.availHeight,
    required this.pageController,
  });

  final double availHeight;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: availHeight,
      padding: EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Spacer(),
        Center(
          child: FadeOut(
            child: Lottie.asset('animations/visualizeInclusivity.json',
                height: 350, reverse: true, repeat: true, fit: BoxFit.cover),
          ),
        ),
        Center(
          child: FadeInDown(
              delay: Duration(milliseconds: 500),
              child: Text(
                "Visualize Inclusivity",
                style: TextStyle(
                    fontWeight: bold,
                    fontSize: MediaQuery.of(context).size.width * 0.1),
                textAlign: TextAlign.center,
              )),
        ),
        Center(
          child: FadeInDown(
              delay: Duration(milliseconds: 750),
              child: Text(
                "Try it now and support a better inclusivity",
                style: TextStyle(
                  // fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * 0.06,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              )),
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const Spacer(),
            FadeInDown(
              delay: Duration(
                seconds: 1,
              ),
              child: SizedBox(
                height: 60,
                width: MediaQuery.of(context).size.width * 0.64,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: Colors.white,
                    elevation: 0,
                    side: BorderSide(color: Colors.black),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Selanjutnya",
                          style: TextStyle(fontSize: 27, color: Colors.black)),
                      Icon(
                        Icons.keyboard_double_arrow_right,
                        color: Colors.black,
                        size: 45,
                      )
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            LoginPage(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          const begin = Offset(1.0, 0.0);
                          const end = Offset.zero;
                          const curve = Curves.easeInOut;

                          var tween = Tween(begin: begin, end: end)
                              .chain(CurveTween(curve: curve));
                          var offsetAnimation = animation.drive(tween);

                          return SlideTransition(
                              position: offsetAnimation, child: child);
                        },
                        transitionDuration: Duration(milliseconds: 700),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        const Spacer(),
      ]),
    );
  }
}
