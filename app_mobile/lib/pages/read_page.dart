import 'package:app_mobile/constants.dart';
import 'package:app_mobile/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:speech_to_text/speech_to_text.dart';

class ReadPage extends StatefulWidget {
  const ReadPage({Key? key}) : super(key: key);

  @override
  State<ReadPage> createState() => _ListenPageState();
}

class _ListenPageState extends State<ReadPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final FirebaseAuth _authGoogle = FirebaseAuth.instance;

  final SpeechToText _speechToText = SpeechToText();

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
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        centerTitle: true,

        // backgroundColor: Colors.blue[800],
        iconTheme: IconThemeData(color: Colors.white),

        title: Text(
          "VISILA read",
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
                              'animations/read.png',
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
                                "Untuk ubah suaramu jadi tulisan",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, "/bantuan");
                          },
                          child: Column(
                            children: [
                              const Icon(Icons.question_mark,
                                  color: secondaryColor, size: 40),
                              Text(
                                "Bantuan",
                                style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
            SizedBox(
              height: 10,
            ),

            Container(
              // margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.only(top: 10, bottom: 6, left: 6, right: 6),
              child: Image.asset(
                _speechToText.isListening
                    ? "animations/suara.png"
                    : _speechEnable
                        ? "animations/speak.png"
                        : "",
              ),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 16),
              padding: EdgeInsets.all(4),
              child: Text(
                _speechToText.isListening
                    ? "Sedang mendengarkan..."
                    : _speechEnable
                        ? "Apa yang akan kamu katakan?"
                        : "",
                style: TextStyle(
                  color: Colors.yellow[700],
                  fontSize: 20.0,
                  // fontWeight: bold
                ),
              ),
            ),

            Text("Teks",
                style: TextStyle(
                    fontSize: 21, color: Colors.blue[800], fontWeight: bold)),

            Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.only(bottom: 40, top: 10),
                color: Colors.white,
                width: 350,
                child: SingleChildScrollView(
                  child: TextField(
                    minLines: 1,
                    maxLines: 999,
                    enabled: false,
                    decoration: InputDecoration(
                      hintText: _wordSpoken,
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                      // border: OutlineInputBorder(),
                      // focusedBorder: OutlineInputBorder(
                      //   borderSide: BorderSide(color: Colors.blue)
                      // ),
                    ),
                  ),
                ),
              ),
            ),

            // child: Text(
            //   _wordSpoken,
            //   style: const TextStyle(
            //       fontSize: 25,
            //       fontWeight: FontWeight.bold,
            //       // backgroundColor: Colors.blue
            //       // fontWeight: FontWeight.w300
            //     ),
            // ),

            // Expanded(
            //   child: Container(

            //     decoration: BoxDecoration(
            //       color: Colors.red
            //     ),
            //     padding: EdgeInsets.all(16),
            //     child: Text(
            //       _wordSpoken,
            //       style: const TextStyle(
            //         fontSize: 25,
            //         fontWeight: FontWeight.bold
            //         // fontWeight: FontWeight.w300
            //       ),
            //     )
            //   )
            // ),

            // if (_speechToText.isNotListening && _confidenceLevel > 0)
            // Padding(
            //   padding: const EdgeInsets.only(
            //     bottom: 100,
            //   ),
            //   child: Text(
            //       "Confidence: ${(_confidenceLevel * 100).toStringAsFixed(1)}%",
            //       style: TextStyle(
            //         fontSize: 30,
            //         fontWeight: FontWeight.w200
            //       ),
            //     ),
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // child: Icon(Icons.home, color: Colors.white),
        onPressed: _speechToText.isListening ? _stopListening : _startListening,
        child: Icon(
          _speechToText.isNotListening ? Icons.mic_off : Icons.mic,
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
                onPressed: () {
                  Navigator.pushReplacementNamed(context, "/bantuan");
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
