import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class NewListenPage extends StatefulWidget {
  const NewListenPage({super.key});

  @override
  State<NewListenPage> createState() => _ListenPageState();
}

class _ListenPageState extends State<NewListenPage> {
  FlutterTts _flutterTts = FlutterTts();

  List<Map> _voices = [];
  Map? _currentVoice;

  int? _currentWordStart, _currentWordEnd;
  String _inputText = '';

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
          _voices = _voices.where((_voice) => _voice["name"].contains("id")).toList(); // Filter suara Indonesia
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
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: _inputText.substring(0, _currentWordStart)),
                      if (_currentWordStart != null)
                        TextSpan(
                          text: _inputText.substring(_currentWordStart!, _currentWordEnd),
                          style: const TextStyle(
                            color: Colors.white,
                            backgroundColor: Colors.purpleAccent,
                          ),
                        ),
                      if (_currentWordEnd != null)
                        TextSpan(text: _inputText.substring(_currentWordEnd!)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: _speakText,
        child: const Icon(Icons.speaker_phone),
      ),
    );
  }

  void _speakText() {
    _flutterTts.speak(_inputText);
  }
}



