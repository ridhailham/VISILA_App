import 'package:app_mobile/constants.dart';
import 'package:app_mobile/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _HomePageState();
}

class _HomePageState extends State<CameraPage> {
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        centerTitle: true,

        // backgroundColor: Colors.blue[800],
        iconTheme: IconThemeData(color: Colors.white),

        title: Text(
          "VISILA cam",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ), 
          // actions: [
          //   Padding(
          //     padding: const EdgeInsets.all(8),
          //     child: InkWell(
          //       onTap: () {
          //         Navigator.pop(context);
          //       },
          //     ),
          //   ),
          // ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            
            Container(
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
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              'animations/cam.png',
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Untuk terjemah bahasa isyaratmu",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          children: [
                            Icon(
                              Icons.help_outline,
                              color: Colors.yellow[700],
                              size: 40,
                            ),
                            Text(
                              'Bantuan',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // ISI MACHINE LEARNING BAGIAN SINI
            // ISI MACHINE LEARNING BAGIAN SINI
            // ISI MACHINE LEARNING BAGIAN SINI
            // ISI MACHINE LEARNING BAGIAN SINI
            
            
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt, color: Colors.white),
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
                onPressed: () {},
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
                    )
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 40,
                padding: EdgeInsets.only(right: 50),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home,
                      color: Colors.yellow[700],
                      size: 32,
                    ),
                    Text(
                      'Home',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
