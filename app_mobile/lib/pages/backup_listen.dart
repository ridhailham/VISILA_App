import 'package:app_mobile/constants.dart';
import 'package:app_mobile/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:lottie/lottie.dart';
import 'package:speech_to_text/speech_to_text.dart';

class ListenPage extends StatefulWidget {
  const ListenPage({Key? key}) : super(key: key);

  @override
  State<ListenPage> createState() => _ListenPageState();
}

class _ListenPageState extends State<ListenPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final FirebaseAuth _authGoogle = FirebaseAuth.instance;

  FlutterTts _flutterTts = FlutterTts();

  List<Map> _voices = [];
  Map? _currentVoice;

  int? _currentWordStart, _currentWordEnd;
  String _inputText = '';

  User? _user;

  @override
  void initState() {
    super.initState();
    initTTS();
    _authGoogle.authStateChanges().listen((event) {
      setState(() {
        _user = event;
        
      });
    });
  }

  void initTTS() {
    _flutterTts.setProgressHandler((text, start, end, word) {
      setState(() {
        _currentWordStart = start;
        _currentWordEnd = end;
      });
    });
    _flutterTts.getVoices.then((data) {
      try {
        _voices = List<Map>.from(data);

        setState(() {
          _voices = _voices
              .where((_voice) => _voice["name"].contains("id"))
              .toList(); // Filter suara Indonesia
          _currentVoice = _voices.first;
          setVoice(_currentVoice!);
        });
      } catch (e) {
        print(e);
      }
    });
  }

  void setVoice(Map voice) {
    _flutterTts.setVoice({"name": voice["name"], "locale": voice["locale"]});
  }

  void _speakText() {
    _flutterTts.speak(_inputText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        centerTitle: true,

        // backgroundColor: Colors.blue[800],
        iconTheme: IconThemeData(color: Colors.white),

        title: Text(
          "VISILA listen",
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
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
                              'animations/listen.png',
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
                                "Untuk ubah tulisanmu jadi suara",
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
                                  TextStyle(color: Colors.white, fontSize: 16),
                            )
                          ],
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
              height: 20,
            ),
            Text("Teks",
                style: TextStyle(
                    fontSize: 24, color: Colors.blue[800], fontWeight: bold)),

            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 10),
                  child: TextField(
                    
                    onChanged: (text) {
                      setState(() {
                        _inputText = text;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Masukkan teks untuk diucapkan',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                Container(
                  
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: _inputText.substring(0, _currentWordStart)),
                        if (_currentWordStart != null)
                          TextSpan(
                            text: _inputText.substring(
                                _currentWordStart!, _currentWordEnd),
                            style: const TextStyle(
                              color: Colors.white,
                              backgroundColor: Colors.purpleAccent,
                            ),
                          ),
                        if (_currentWordEnd != null)
                          TextSpan(
                              text: _inputText.substring(_currentWordEnd!)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // child: Icon(Icons.home, color: Colors.white),
        onPressed: _speakText,
        child: const Icon(
          Icons.speaker_phone,
          color: Colors.white,
        ),
        // child: Icon(
        //   Icon(Icons.speaker_phone),
        //   color: Colors.white,
        // ),
        // onPressed: () {},
        backgroundColor: Colors.yellow[700],
        shape: CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue[800],
        shape: CircularNotchedRectangle(),
        // notchMargin: 10,
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
                      'Profil',
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
