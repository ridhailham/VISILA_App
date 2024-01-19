// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// import 'ProductDataModel.dart'; // Import your data model

// class NewsPage extends StatefulWidget {
//   const NewsPage({Key? key}) : super(key: key);

//   @override
//   State<NewsPage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<NewsPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       appBar: AppBar(
//         // ... (your existing app bar code)
//       ),
//       body: FutureBuilder(
//         future: ReadJsonData(),
//         builder: (context, data) {
//           if (data.hasError) {
//             return Center(
//               child: Text("${data.error}"),
//             );
//           } else if (data.hasData) {
//             var items = data.data as List<ProductDataModel>;
//             return ListView.builder(
//               itemCount: items.length,
//               itemBuilder: (context, index) {
//                 return InkWell(
//                   onTap: () {
//                     _launchURL(items[index].url); // Use items[index].url
//                   },
//                   child: Card(
//                     elevation: 5,
//                     margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//                     child: Container(
//                       padding: EdgeInsets.all(8),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Container(
//                             width: double.infinity,
//                             height: 200,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(12.0),
//                             ),
//                             child: Image(
//                               image: NetworkImage(
//                                 items[index].imageURL.toString(),
//                               ),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                           Container(
//                             padding: EdgeInsets.all(8),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   items[index].name.toString(),
//                                   style: TextStyle(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 SizedBox(height: 8),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             );
//           } else {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//     );
//   }

//   Future<List<ProductDataModel>> ReadJsonData() async {
//     // Your existing code to read JSON data
//   }

//   Future<void> _launchURL(String url) async {
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
// }
