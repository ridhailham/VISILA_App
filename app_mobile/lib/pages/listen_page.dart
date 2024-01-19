import 'package:app_mobile/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';

class ListenPage extends StatefulWidget {
  const ListenPage({Key? key}) : super(key: key);

  @override
  State<ListenPage> createState() => _ListenPageState();
}

class _ListenPageState extends State<ListenPage> {
  FlutterTts _flutterTts = FlutterTts();

  List<Map> _voices = [];
  Map? _currentVoice;
  bool isSpeaking = false;

  int? _currentWordStart, _currentWordEnd;
  TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    initTTS();
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
              .where((_voice) => _voice["locale"] == "id-ID")
              .toList(); // Filter for Indonesian locale
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
          "VISILA listen",
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
      body: _buildUI(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Colors.yellow[700],
        onPressed: () {
          _flutterTts.speak(_textEditingController.text);
          _flutterTts.setCompletionHandler(() {
            setState(() {
              isSpeaking = false;
            });
          });
          setState(() {
            isSpeaking = true;
          });
        },
        child: Icon(
          isSpeaking ? Icons.volume_up : Icons.volume_off,
          color: Colors.white,
        ),
      ),

      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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

  Widget _buildUI() {
    return SafeArea(
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
                            height: 76,
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
          SizedBox(
            height: 20,
          ),
          Text("Teks",
              style: TextStyle(
                  fontSize: 21,
                  color: const Color.fromRGBO(21, 101, 192, 1),
                  fontWeight: bold)),

          _textEntryField(),

          // _speakerSelector(),

          // RichText(
          //   textAlign: TextAlign.center,
          //   text: TextSpan(
          //     style: TextStyle(
          //       fontWeight: FontWeight.w300,
          //       fontSize: 20,
          //       color: Colors.black,
          //     ),
          //     children: <TextSpan>[
          //       TextSpan(
          //           text: _textEditingController.text
          //               .substring(0, _currentWordStart)),
          //       if (_currentWordStart != null)
          //         TextSpan(
          //           text: _textEditingController.text
          //               .substring(_currentWordStart!, _currentWordEnd),
          //           style: const TextStyle(
          //             color: Colors.white,
          //             backgroundColor: Colors.purpleAccent,
          //           ),
          //         ),
          //       if (_currentWordEnd != null)
          //         TextSpan(
          //             text: _textEditingController.text
          //                 .substring(_currentWordEnd!)),
          //     ],
          //   ),
          // ),

          Container(
            margin: EdgeInsets.only(bottom: 50, right: 25, left: 25),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Dengarkan",
                      style: TextStyle(
                          fontSize: 20,
                          color: const Color.fromRGBO(21, 101, 192, 1),
                          fontWeight: bold)),
                  Container(
                    margin: EdgeInsets.only(top: 2),
                    child: isSpeaking
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("animations/suara.png"),
                              Image.asset("animations/suara.png")
                            ],
                          )
                        : Row(
                            children: [
                              Image.asset("animations/suara.png"),
                              Container(
                                width: 200,
                                child: Text(
                                  "Tulisanmu akan menjadi suara di sini",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.yellow[700],
                                    fontWeight: bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _textEntryField() {
    return Container(
      height: 250, // Set your desired fixed height
      margin: EdgeInsets.only(bottom: 25, top: 10),
      color: Colors.white,
      width: 350,
      child: SingleChildScrollView(
        child: TextField(
          cursorRadius: Radius.circular(20),
          controller: _textEditingController,
          style:
              TextStyle(color: Colors.blue[700], fontWeight: FontWeight.bold),
          minLines: 1,
          maxLines: 999,
          enabled: !isSpeaking,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Tulis kalimatmu di sini",
            hintStyle: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 1, horizontal: 15),
            // border: OutlineInputBorder(),dadadwasdwasadw
            // focusedBorder: OutlineInputBorder(
            //   borderSide: BorderSide(color: Colors.blue)
            // ),
          ),
        ),
      ),
    );
  }

  Widget _speakerSelector() {
    return DropdownButton(
      value: _currentVoice,
      items: _voices
          .map((_voice) =>
              DropdownMenuItem(value: _voice, child: Text(_voice["name"])))
          .toList(),
      onChanged: (value) {
        setState(() {
          _currentVoice = value;
          setVoice(_currentVoice!);
        });
      },
    );
  }
}








// import 'package:flutter/material.dart';
// import 'package:flutter_tts/flutter_tts.dart';

// class ListenPage extends StatefulWidget {
//   const ListenPage({Key? key}) : super(key: key);

//   @override
//   State<ListenPage> createState() => _ListenPageState();
// }

// class _ListenPageState extends State<ListenPage> {
//   FlutterTts _flutterTts = FlutterTts();

//   List<Map> _voices = [];
//   Map? _currentVoice;

//   int? _currentWordStart, _currentWordEnd;
//   TextEditingController _textEditingController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     initTTS();
//   }

//   void initTTS() {
//     _flutterTts.setProgressHandler((text, start, end, word) {
//       setState(() {
//         _currentWordStart = start;
//         _currentWordEnd = end;
//       });
//     });
//     _flutterTts.getVoices.then((data) {
//       try {
//         _voices = List<Map>.from(data);

//         setState(() {
//           _voices = _voices.where((_voice) => _voice["name"].contains("id")).toList(); // Filter untuk suara Indonesia
//           _currentVoice = _voices.first;
//           setVoice(_currentVoice!);
//         });
//       } catch (e) {
//         print(e);
//       }
//     });
//   }

//   void setVoice(Map voice) {
//     _flutterTts.setVoice({"name": voice["name"], "locale": voice["locale"]});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _buildUI(),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           _flutterTts.speak(_textEditingController.text);
//         },
//         child: const Icon(Icons.speaker_phone),
//       ),
//     );
//   }

//   Widget _buildUI() {
//     return SafeArea(
//       child: Column(
//         children: [
//           Container(
//             padding: EdgeInsets.only(bottom: 25),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(20),
//                 bottomRight: Radius.circular(20),
//               ),
//               color: Colors.blue[800],
//             ),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 25),
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       Column(
//                         children: [
//                           Image.asset(
//                             'animations/listen.png',
//                             height: 80,
//                             fit: BoxFit.cover,
//                           ),
//                         ],
//                       ),
//                       SizedBox(width: 15),
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Untuk ubah tulisanmu jadi suara",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 18,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(width: 10),
//                       Column(
//                         children: [
//                           Icon(
//                             Icons.help_outline,
//                             color: Colors.yellow[700],
//                             size: 40,
//                           ),
//                           Text(
//                             'Bantuan',
//                             style: TextStyle(color: Colors.white, fontSize: 16),
//                           )
//                         ],
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           _textEntryField(),
//           _speakerSelector(),
//           RichText(
//             textAlign: TextAlign.center,
//             text: TextSpan(
//               style: TextStyle(
//                 fontWeight: FontWeight.w300,
//                 fontSize: 20,
//                 color: Colors.black,
//               ),
//               children: <TextSpan>[
//                 TextSpan(text: _textEditingController.text.substring(0, _currentWordStart)),
//                 if (_currentWordStart != null)
//                   TextSpan(
//                     text: _textEditingController.text.substring(_currentWordStart!, _currentWordEnd),
//                     style: const TextStyle(
//                       color: Colors.white,
//                       backgroundColor: Colors.purpleAccent,
//                     ),
//                 ),
//                 if (_currentWordEnd != null)
//                   TextSpan(text: _textEditingController.text.substring(_currentWordEnd!)),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _textEntryField() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: TextField(
//         controller: _textEditingController,
//         decoration: InputDecoration(
//           hintText: 'Enter text here',
//         ),
//       ),
//     );
//   }

//   Widget _speakerSelector() {
//     return DropdownButton(
//       value: _currentVoice,
//       items: _voices.map((_voice) => DropdownMenuItem(value: _voice, child: Text(_voice["name"]))).toList(),
//       onChanged: (value) {
//         setState(() {
//           _currentVoice = value;
//           setVoice(_currentVoice!);
//         });
//       },
//     );
//   }
// }















// import 'package:app_mobile/constants.dart';
// import 'package:app_mobile/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:speech_to_text/speech_to_text.dart';

// class ListenPage extends StatefulWidget {
//   const ListenPage({Key? key}) : super(key: key);

//   @override
//   State<ListenPage> createState() => _ListenPageState();
// }

// class _ListenPageState extends State<ListenPage> {
//   final FirebaseAuthService _auth = FirebaseAuthService();
//   final FirebaseAuth _authGoogle = FirebaseAuth.instance;

//   final SpeechToText _speechToText = SpeechToText();

//   bool _speechEnable = false;
//   String _wordSpoken = "";
//   double _confidenceLevel = 0;

//   User? _user;

//   @override
//   void initState() {
//     super.initState();
//     initSpeech();
//     _authGoogle.authStateChanges().listen((event) {
//       setState(() {
//         _user = event;
//       });
//     });
//   }

//   void initSpeech() async {
//     _speechEnable = await _speechToText.initialize();
//     setState(() {});
//   }

//   void _startListening() async {
//     await _speechToText.listen(onResult: _onSpeechResult);
//     setState(() {
//       _confidenceLevel = 0;
//     });
//   }

//   void _stopListening() async {
//     await _speechToText.stop();
//     setState(() {});
//   }

//   void _onSpeechResult(result) {
//     setState(() {
//       _wordSpoken = "${result.recognizedWords}";
//       _confidenceLevel = result.confidence;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[300],
//       appBar: AppBar(
//         backgroundColor: Colors.blue[800],
//         centerTitle: true,
        
//         // backgroundColor: Colors.blue[800],
//         iconTheme: IconThemeData(color: Colors.white),
        
//         title: Text(
//           "VISILA listen",
//           style: TextStyle(                     
//             color: Colors.white,                      
//             fontSize: 26,                        
//             fontWeight: FontWeight.bold, 
                      

//           ),
//         // actions: [
//         //   Padding(
//         //     padding: const EdgeInsets.all(8),
//         //     child: InkWell(
//         //       onTap: () {
//         //         Navigator.pop(context);
//         //       },
//         //     ),
//         //   ),
//         // ],
//         ),
//       ),

//       body: SafeArea(
        
//         child: Column(
          
//           children: [
//             Container(
//               padding: EdgeInsets.only( bottom: 25),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(20),
//                   bottomRight: Radius.circular(20),
//                 ),
//                 color: Colors.blue[800],
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 25),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Column(
//                           children: [
//                             Image.asset(
//                               'animations/listen.png',
//                               height: 80,
//                               fit: BoxFit.cover,
//                             ),
//                           ],
//                         ),
//                         SizedBox(width: 15),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
                              
//                               Text(
//                                 "Untuk ubah tulisanmu jadi suara",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 18,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(width: 10),
//                         Column(
//                           children: [
//                             Icon(
//                               Icons.help_outline,
//                               color: Colors.yellow[700],
//                               size: 40,
//                             ),
//                             Text(
//                               'Bantuan',
//                               style: TextStyle(color: Colors.white, fontSize: 16),
//                             )
                            
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             // Expanded(
//             //   child: GridView.count(
//             //     crossAxisCount: 2,
//             //     padding: EdgeInsets.only(top: 55, bottom: 20),
//             //     // Adjust this value to make the cards longer vertically
//             //     children: <Widget>[
//             //       Expanded(
//             //         child: Card(
//             //           margin: const EdgeInsets.all(8),
//             //           child: InkWell(
//             //             onTap: () {},
//             //             splashColor: Colors.blue,
//             //             child: Center(
//             //               child: Column(
//             //                 mainAxisSize: MainAxisSize.min,
//             //                 children: <Widget>[
//             //                   Image.asset(
//             //                     'animations/homepagetrompet.png',
//             //                     height: 120,
//             //                     fit: BoxFit.cover,
//             //                   ),
//             //                   Text("VISILA Cam", style: TextStyle(fontSize: 20, color: Colors.blue[800], fontWeight: bold)),
//             //                 ],
//             //               ),
//             //             ),
//             //           ),
//             //         ),
//             //       ),
//             //       Expanded(
//             //         child: Card(
//             //           margin: const EdgeInsets.all(8),
//             //           child: InkWell(
//             //             onTap: () {},
//             //             splashColor: Colors.blue,
//             //             child: Center(
//             //               child: Column(
//             //                 mainAxisSize: MainAxisSize.min,
//             //                 children: <Widget>[
//             //                   Image.asset(
//             //                     'animations/homepageread.png',
//             //                     height: 120,
//             //                     fit: BoxFit.cover,
//             //                   ),
//             //                   Text("VISILA Read", style: TextStyle(fontSize: 20, color: Colors.blue[800], fontWeight: bold)),
//             //                 ],
//             //               ),
//             //             ),
//             //           ),
//             //         ),
//             //       ),
//             //       Expanded(
//             //         child: Card(
//             //           margin: const EdgeInsets.all(8),
//             //           child: InkWell(
//             //             onTap: () {},
//             //             splashColor: Colors.blue,
//             //             child: Center(
//             //               child: Column(
//             //                 mainAxisSize: MainAxisSize.min,
//             //                 children: <Widget>[
//             //                   Image.asset(
//             //                     'animations/homepagelisten.png',
//             //                     height: 120,
//             //                     fit: BoxFit.cover,
//             //                   ),
//             //                   Text("VISILA Listen", style: TextStyle(fontSize: 20, color: Colors.blue[800], fontWeight: bold)),
//             //                 ],
//             //               ),
//             //             ),
//             //           ),
//             //         ),
//             //       ),
//             //      Expanded(
//             //         child: Card(
//             //           margin: const EdgeInsets.all(8),
//             //           child: InkWell(
//             //             onTap: () {},
//             //             splashColor: Colors.blue,
//             //             child: Center(
//             //               child: Column(
//             //                 mainAxisSize: MainAxisSize.min,
//             //                 children: <Widget>[
//             //                   Image.asset(
//             //                     'animations/homepagenews.png',
//             //                     height: 120,
//             //                     fit: BoxFit.cover,
//             //                   ),
//             //                   Text("VISILA News", style: TextStyle(fontSize: 20, color: Colors.blue[800], fontWeight: bold)),
//             //                 ],
//             //               ),
//             //             ),
//             //           ),
//             //         ),
//             //       ),
//             //     ],
//             //   ),
//             // ),
//             SizedBox(height: 20,),
//             Text("Teks", style: TextStyle(fontSize: 24, color: Colors.blue[800], fontWeight: bold)),
            
//             Spacer(),
            
            
//             Expanded(
//               child: Container(
//                 padding: EdgeInsets.all(16),
//                 child: Text(
//                   _wordSpoken,
//                   style: const TextStyle(
//                     fontSize: 25,
//                     fontWeight: FontWeight.bold
//                     // fontWeight: FontWeight.w300  
//                   ),
//                 )
//               )
//             ),

//             // if (_speechToText.isNotListening && _confidenceLevel > 0) 
//             // Padding(
//             //   padding: const EdgeInsets.only(
//             //     bottom: 100,
//             //   ),
//             //   child: Text(
//             //       "Confidence: ${(_confidenceLevel * 100).toStringAsFixed(1)}%",
//             //       style: TextStyle(
//             //         fontSize: 30,
//             //         fontWeight: FontWeight.w200
//             //       ),
//             //     ),
//             // ),

//             Container(apa yang akan
//               margin: EdgeInsets.only(bottom: 30),
//               padding: EdgeInsets.all(16),
//               child: Text(
//                 _speechToText.isListening 
//                   ? "Mendengarkan..." : _speechEnable 
//                   ? "Apa yang akan kamu katakan?" : "",
//                   style: TextStyle(color: Colors.blue[800], fontSize: 20.0, fontWeight: bold),
//               ),
//             ),
            
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         // child: Icon(Icons.home, color: Colors.white),
//         onPressed: _speechToText.isListening ? _stopListening : _startListening,
//         child: Icon(
//           _speechToText.isNotListening ? Icons.mic_off : Icons.mic,
//           color: Colors.white,
//         ),
//         // onPressed: () {},
//         backgroundColor: Colors.yellow[700],
//         shape: CircleBorder(),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: BottomAppBar(
//         color: Colors.blue[800],
//         shape: CircularNotchedRectangle(),
//         notchMargin: 10,
//         child: Container(
//           height: 60,
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               MaterialButton(
//                 padding: EdgeInsets.only(left: 50),
//                 minWidth: 40,
//                 onPressed: () {},
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(
//                       Icons.help_outline,
//                       color: Colors.yellow[700],
//                       size: 32,
//                     ),
//                     Text(
//                       'Bantuan',
//                       style: TextStyle(color: Colors.white, fontSize: 15),
//                     )
//                   ],
//                 ),
//               ),
//               MaterialButton(
//                 minWidth: 40,
//                 padding: EdgeInsets.only(right: 50),
//                 onPressed: () {},
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(
//                       Icons.account_circle,
//                       color: Colors.yellow[700],
//                       size: 32,
//                     ),
//                     Text(
//                       'Profil',
//                       style: TextStyle(color: Colors.white, fontSize: 15),
//                     )
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
