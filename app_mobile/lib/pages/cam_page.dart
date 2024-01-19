import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:app_mobile/main.dart';
import 'package:app_mobile/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:app_mobile/widgets/header_bar.dart';
import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socket_io_client/socket_io_client.dart' as ws;

import '../constants.dart';

class CameraPage extends StatefulWidget {
  CameraPage({Key? key}) : super(key: key);

  bool isRecording = false;
  String predictedWord = "Hasil Prediksi Akan Muncul Disini";

  @override
  State<CameraPage> createState() => _HomePageState();
}

class _HomePageState extends State<CameraPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final FirebaseAuth _authGoogle = FirebaseAuth.instance;

  User? _user;
  late CameraController _controller;
  late ws.Socket socket;
  int selectedCamera = cameras.length > 1 ? 1 : 0;

  void _onCameraCapture() async {
    _controller.setFlashMode(FlashMode.off);
    try {
      socket.on('prediction_result', (data) {
        if (data is String) {
          String wordResponse = data;
          setState(() {
            widget.predictedWord = wordResponse;
          });
        }
      });

      Timer.periodic(const Duration(seconds: 1), (Timer timer) async {
        if (!widget.isRecording) {
          timer.cancel();
          return;
        }

        try {
          final videoPath = await _controller.takePicture();
          String videoBase64 = base64Encode(await videoPath.readAsBytes());

          socket.emit('process_image', videoBase64);
        } catch (e) {
          log("$e");
        }
      });
    } catch (e) {
      log("$e");
    }
  }

  void toggleRecording() {
    setState(() {
      widget.isRecording = !widget.isRecording;
    });

    if (widget.isRecording) {
      setState(() {
        widget.predictedWord = "Hasil Prediksi Akan Muncul Disini";
      });
      _onCameraCapture();
    }
  }

  void _initCamera() async {
    _controller =
        CameraController(cameras[selectedCamera], ResolutionPreset.medium);
    _controller.initialize().then((_) {
      if (!mounted) {
        return;
      }

      _connectSocket();
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  void _connectSocket() {
    socket =
        ws.io('https://new-pumped-gannet.ngrok-free.app', <String, dynamic>{
      'transports': ['websocket'],
    });

    socket.onConnect((_) {
      log('Connected to server');
    });

    socket.connect();
  }

  @override
  void initState() {
    super.initState();
    _initCamera();
    _authGoogle.authStateChanges().listen((event) {
      setState(() {
        _user = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        toolbarHeight: queryData.size.height * 0.17,
        title: const HeaderBar(),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 40, top: 8),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black),
                  constraints: BoxConstraints.expand(
                    width: queryData.size.width * 0.92,
                    height: queryData.size.height * 0.55,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: CameraPreview(_controller),
                        ),
                        Positioned(
                          top: 4,
                          right: 0,
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                widget.isRecording = false;

                                if (cameras.length > 1) {
                                  selectedCamera = selectedCamera == 0 ? 1 : 0;
                                }
                              });
                              _initCamera();
                            },
                            child: const Icon(
                              Icons.flip_camera_ios,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.isRecording ? "Menerjemahkan.." : "Mulai Menerjemahkan !",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    color: primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: secondaryColor,
                    ),
                    // color: ,
                  ),
                  width: queryData.size.width * 0.9,
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    widget.predictedWord,
                    style: GoogleFonts.lato(
                      color: primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          toggleRecording();
        },
        backgroundColor: Colors.yellow[700],
        shape: const CircleBorder(),
        child: widget.isRecording
            ? const Icon(
                Icons.stop,
                color: Colors.white,
              )
            : const Icon(
                Icons.videocam,
                color: Colors.white,
              ),
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
