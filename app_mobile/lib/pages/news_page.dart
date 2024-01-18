import 'dart:convert';

import 'package:app_mobile/ProductDataModel.dart';
import 'package:app_mobile/constants.dart';
import 'package:app_mobile/pages/cam_page.dart';
import 'package:app_mobile/pages/home_page.dart';
import 'package:app_mobile/pages/listen_page.dart';
import 'package:app_mobile/pages/login_page.dart';
import 'package:app_mobile/pages/new_listen_page.dart';
import 'package:app_mobile/pages/bantuan_page.dart';
import 'package:app_mobile/pages/onboarding1_page.dart';
import 'package:app_mobile/pages/profile_page.dart';
import 'package:app_mobile/pages/read_page.dart';
import 'package:app_mobile/pages/register_page.dart';
import 'package:app_mobile/pages/speech_page.dart';
import 'package:app_mobile/pages/splash_page.dart';
import 'package:app_mobile/widgets/header_news.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/services.dart' as rootBundle;

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        toolbarHeight: 150,
        centerTitle: true,
        title: HeaderNews(),
        backgroundColor: Colors.blue[800],
        iconTheme: IconThemeData(color: Colors.white),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
        ),
      ),
      body: FutureBuilder(
        future: ReadJsonData(),
        builder: (context, data) {
          if (data.hasError) {
            return Center(
              child: Text("${data.error}"),
            );
          } else if (data.hasData) {
            var items = data.data as List<ProductDataModel>;
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Card(
                  
                  elevation: 5,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: Container(
                    
                    padding: EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width:
                              double.infinity, // Menyesuaikan lebar dengan Card
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                12.0), // Membuat sudut tumpul
                          ), // Atur tinggi sesuai kebutuhan
                          child: Image(
                            image:
                                NetworkImage(items[index].imageURL.toString()),
                            fit: BoxFit.cover, // Sesuaikan dengan kebutuhan
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                items[index]
                                    .name
                                    .toString(), // Menggunakan nama dari data
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<List<ProductDataModel>> ReadJsonData() async {
    final jsondata =
        await rootBundle.rootBundle.loadString('jsonfile/productlist.json');
    final list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => ProductDataModel.fromJson(e)).toList();
  }
}
