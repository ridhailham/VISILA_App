import 'package:app_mobile/constants.dart';
import 'package:app_mobile/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:speech_to_text/speech_to_text.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ListenPageState();
}

class _ListenPageState extends State<ProfilePage> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final FirebaseAuth _authGoogle = FirebaseAuth.instance;

  final SpeechToText _speechToText = SpeechToText();

  User? user;

  bool _speechEnable = false;
  String _wordSpoken = "";
  double _confidenceLevel = 0;

  User? _user;

  @override
  void initState() {
    super.initState();
    initSpeech();
    _authGoogle.authStateChanges().listen((event) {
      setState(() {
        _user = event;
      });
    });
  }

  void initSpeech() async {
    _speechEnable = await _speechToText.initialize();
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {
      _confidenceLevel = 0;
    });
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(result) {
    setState(() {
      _wordSpoken = "${result.recognizedWords}";
      _confidenceLevel = result.confidence;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        centerTitle: true,

        // backgroundColor: Colors.blue[800],
        iconTheme: IconThemeData(color: Colors.white),

        title: Text(
          "Halaman Profile",
          style: TextStyle(
            color: Colors.white,
            fontSize: 27,
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
      // appBar: AppBar(
      //   backgroundColor: Colors.blue[800],
      //   centerTitle: true,

      //   // backgroundColor: Colors.blue[800],
      //   // iconTheme: IconThemeData(color: Colors.white),

      //   // title: Text(
      //   //   "VISILA read",
      //   //   style: TextStyle(
      //   //     color: Colors.white,
      //   //     fontSize: 26,
      //   //     fontWeight: FontWeight.bold,
      //   //   ),
      //   //   // actions: [
      //   //   //   Padding(
      //   //   //     padding: const EdgeInsets.all(8),
      //   //   //     child: InkWell(
      //   //   //       onTap: () {
      //   //   //         Navigator.pop(context);
      //   //   //       },
      //   //   //     ),
      //   //   //   ),
      //   //   // ],
      //   // ),
      // ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              // padding: EdgeInsets.only(bottom: 25, top: 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                color: Colors.blue[800],
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 25, left: 25, top: 5, bottom: 50),
                child: Column(
                  children: [
                    // Text(
                    //   "Halaman Profile",
                    //   style: TextStyle(
                    //     color: Colors.white,
                    //     fontSize: 32,
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
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 70,
                              backgroundImage:
                                  AssetImage('animations/fotoprofile.png'),
                            ),
                          )
                        ]),
                  ],
                ),
              ),
            ),
            // Expanded(
            //   child: GridView.count(
            //     crossAxisCount: 2,
            //     padding: EdgeInsets.only(top: 55, bottom: 20),
            //     // Adjust this value to make the cards longer vertically
            //     children: <Widget>[
            //       Expanded(
            //         child: Card(
            //           margin: const EdgeInsets.all(8),
            //           child: InkWell(
            //             onTap: () {},
            //             splashColor: Colors.blue,
            //             child: Center(
            //               child: Column(
            //                 mainAxisSize: MainAxisSize.min,
            //                 children: <Widget>[
            //                   Image.asset(
            //                     'animations/homepagetrompet.png',
            //                     height: 120,
            //                     fit: BoxFit.cover,
            //                   ),
            //                   Text("VISILA Cam", style: TextStyle(fontSize: 20, color: Colors.blue[800], fontWeight: bold)),
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //       Expanded(
            //         child: Card(
            //           margin: const EdgeInsets.all(8),
            //           child: InkWell(
            //             onTap: () {},
            //             splashColor: Colors.blue,
            //             child: Center(
            //               child: Column(
            //                 mainAxisSize: MainAxisSize.min,
            //                 children: <Widget>[
            //                   Image.asset(
            //                     'animations/homepageread.png',
            //                     height: 120,
            //                     fit: BoxFit.cover,
            //                   ),
            //                   Text("VISILA Read", style: TextStyle(fontSize: 20, color: Colors.blue[800], fontWeight: bold)),
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //       Expanded(
            //         child: Card(
            //           margin: const EdgeInsets.all(8),
            //           child: InkWell(
            //             onTap: () {},
            //             splashColor: Colors.blue,
            //             child: Center(
            //               child: Column(
            //                 mainAxisSize: MainAxisSize.min,
            //                 children: <Widget>[
            //                   Image.asset(
            //                     'animations/homepagelisten.png',
            //                     height: 120,
            //                     fit: BoxFit.cover,
            //                   ),
            //                   Text("VISILA Listen", style: TextStyle(fontSize: 20, color: Colors.blue[800], fontWeight: bold)),
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //      Expanded(
            //         child: Card(
            //           margin: const EdgeInsets.all(8),
            //           child: InkWell(
            //             onTap: () {},
            //             splashColor: Colors.blue,
            //             child: Center(
            //               child: Column(
            //                 mainAxisSize: MainAxisSize.min,
            //                 children: <Widget>[
            //                   Image.asset(
            //                     'animations/homepagenews.png',
            //                     height: 120,
            //                     fit: BoxFit.cover,
            //                   ),
            //                   Text("VISILA News", style: TextStyle(fontSize: 20, color: Colors.blue[800], fontWeight: bold)),
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            Container(
              padding: EdgeInsets.all(35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Nama",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.yellow[800],
                              fontWeight: bold,
                              height: 2)),
                    ],
                  ),
                  Text(
                    _user?.email?.split('@').first ?? "",
                    style: TextStyle(color: Colors.blue[800], fontSize: 25, height: 2),
                    
                  ),
                ],
              ),
            ),
            Container(
                height: 50,
                width: double.infinity,
                margin: EdgeInsets.only(top: 10, left: 20, right: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      side: BorderSide(color: Colors.white),
                      backgroundColor: Colors.red[500]),
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Logout",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          // fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.logout,
                        color: Colors.white,
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // child: Icon(Icons.home, color: Colors.white),
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.home,
          color: Colors.white,
        ),
        // onPressed: () {},
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
                onPressed: () {},
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

// Container(
//   height: 45,
//                               // width: double.infinity,
//     margin: EdgeInsets.only(top: 10, left: 255 ),
//     child: ElevatedButton(
//     style: ElevatedButton.styleFrom(
//       primary: Colors.white,
//       side: BorderSide(color: Colors.blue),
//     ),
//     onPressed: () {
//       FirebaseAuth.instance.signOut();
//       Navigator.pop(context);
//     },
//     child: Text(
//       "Logout",
//       style: TextStyle(
//         fontSize: 17,
//         color: Colors.blue,
//         fontWeight: FontWeight.bold
//       ),
//     ),
//   )
// ),
