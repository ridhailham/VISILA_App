import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Text("berhasil login"),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 45,
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 15),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                side: BorderSide(color: Colors.purple),
              ),
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pop(context);
              },
              child: Text(
                "Logout",
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
