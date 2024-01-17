import 'package:app_mobile/constants.dart';
import 'package:app_mobile/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final FirebaseAuth _authGoogle = FirebaseAuth.instance;

  User? _user;

  @override
  void initState() {
    super.initState();
    _authGoogle.authStateChanges().listen((event) {
      setState(() {
        _user = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Handle back button press
        return false; // Set to false if you want to disable back button
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.blue[800],
          // centerTitle: true,

          // backgroundColor: Colors.blue[800],
          iconTheme: IconThemeData(color: Colors.blue[800]),

          // title: Text(
          //   "Halaman Profile",
          //   style: TextStyle(
          //     color: Colors.white,
          //     fontSize: 27,
          //     fontWeight: FontWeight.bold,
          //   ),
          //   // actions: [
          //   //   Padding(
          //   //     padding: const EdgeInsets.all(8),
          //   //     child: InkWell(
          //   //       onTap: () {
          //   //         Navigator.pop(context);
          //   //       },
          //   //     ),
          //   //   ),
          //   // ],
          // ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 35),
                padding: EdgeInsets.only(bottom: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  color: Colors.blue[800],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Selamat Datang,",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              _user?.email?.split('@').first ?? "",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 30),
                      Column(
                        children: [
                          Image.asset(
                            'animations/homepageAtas.png',
                            height: 130,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 25),
                  Text(
                    "Yuk Jelajahi Fitur-Fitur VISILA!",
                    style: TextStyle(
                      color: Colors.blue[800],
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  padding: EdgeInsets.only(top: 3, bottom: 20),
                  // Adjust this value to make the cards longer vertically
                  children: <Widget>[
                    Expanded(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              12), // Menentukan sudut tumpul
                        ),
                        margin: const EdgeInsets.all(8),
                        child: InkWell(
                          onTap: () {
                            // Navigator.pop(context);
                            Navigator.pushNamed(context, '/camera');
                          },
                          splashColor: Colors.blue,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Image.asset(
                                  'animations/homepagetrompet.png',
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  "VISILA Cam",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.blue[800],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              12), // Menentukan sudut tumpul
                        ),
                        margin: const EdgeInsets.all(8),
                        child: InkWell(
                          onTap: () {
                            // Navigator.pop(context);
                            Navigator.pushNamed(context, '/read');
                          },
                          splashColor: Colors.blue,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Image.asset(
                                  'animations/homepageread.png',
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  "VISILA Read",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.blue[800],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              12), // Menentukan sudut tumpul
                        ),
                        margin: const EdgeInsets.all(8),
                        child: InkWell(
                          onTap: () {
                            // Navigator.pop(context);
                            Navigator.pushNamed(context, '/listen');
                          },
                          splashColor: Colors.blue,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Image.asset(
                                  'animations/homepagelisten.png',
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  "VISILA Listen",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.blue[800],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              12), // Menentukan sudut tumpul
                        ),
                        margin: const EdgeInsets.all(8),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "/news");
                          },
                          splashColor: Colors.blue,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Image.asset(
                                  'animations/homepagenews.png',
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  "VISILA News",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.blue[800],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.home, color: Colors.white),
          onPressed: () {},
          backgroundColor: Colors.yellow[700],
          shape: CircleBorder(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: Colors.blue[800],
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
            height: 60,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  padding: EdgeInsets.only(left: 50),
                  minWidth: 40,
                  onPressed: () {
                    Navigator.pushNamed(context, "/bantuan");
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.help_outline,
                        color: Colors.yellow[700],
                        size: 32,
                      ),
                      Text(
                        'Bantuan',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  padding: EdgeInsets.only(right: 50),
                  onPressed: () {
                    // Navigator.pop(context);
                    Navigator.pushReplacementNamed(context, '/profile');
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.account_circle,
                        color: Colors.yellow[700],
                        size: 32,
                      ),
                      Text(
                        'Profile',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
