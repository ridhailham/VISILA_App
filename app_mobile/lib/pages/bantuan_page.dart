import 'package:app_mobile/constants.dart';
import 'package:app_mobile/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class BantuanPage extends StatefulWidget {
  const BantuanPage({Key? key}) : super(key: key);

  @override
  State<BantuanPage> createState() => _BantuanPageState();
}

class _BantuanPageState extends State<BantuanPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final FirebaseAuth _authGoogle = FirebaseAuth.instance;

  User? _user;

  List<String> items = [
    "What's VISILA ",
    "VISILA cam",
    "VISILA read",
    "VISILA listen",
    "VISLA news",
  ];

  List<Expanded> icons = [
    Expanded(
      child: Container(
        margin: EdgeInsets.only(bottom: 20, top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        width: 350,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 25, right: 20, left: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Apa itu VISILA?",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.yellow[600],
                        fontWeight: bold),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Column(
                children: [
                  Text(
                    "VISILA atau Visual Sign Language Apps merupakan sebuah aplikasi buatan 4 mahasiswa Universitas Brawijaya yang beranggotakan:",
                    style: TextStyle(fontSize: 16, color: Colors.blue[800]),
                    textAlign: TextAlign.justify,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "1. Muhammad Bintang (Hustler)",
                        style: TextStyle(fontSize: 16, color: Colors.blue[800]),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "2. Fajrul Fallaah HIdayatulloh (Hipster)",
                        style: TextStyle(fontSize: 16, color: Colors.blue[800]),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "3. Ridha Ilham (Hacker)",
                        style: TextStyle(fontSize: 16, color: Colors.blue[800]),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "4. Naufal Romero (Hacker)",
                        style: TextStyle(fontSize: 16, color: Colors.blue[800]),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),

    Expanded(
      child: Container(
        margin: EdgeInsets.only(bottom: 20, top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        width: 350,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 25, right: 20, left: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Apa itu VISILA cam?",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.yellow[600],
                        fontWeight: bold),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Column(
                children: [
                  Text(
                    "VISILA Cam merupakan fitur utama dari platform VISILA. Dengan VISILA Cam, pengguna dapat menerjemahkan bahasa isyarat abjad melalui kamera perangkat mereka. Fitur ini memainkan peran kunci dalam memudahkan komunikasi dengan penyandang disabilitas tunarungu, membuka peluang lebih luas untuk interaksi dan pertukaran informasi secara inklusif.",
                    style: TextStyle(fontSize: 16, color: Colors.blue[800]),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),

    Expanded(
      child: Container(
        margin: EdgeInsets.only(bottom: 20, top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        width: 350,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 25, right: 20, left: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Apa itu VISILA read?",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.yellow[600],
                        fontWeight: bold),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Column(
                children: [
                  Text(
                    "VISILA Read adalah fitur yang memungkinkan pengguna mengubah suara menjadi tulisan. Dengan kata lain, fitur ini dapat merespons dan mengonversi pesan lisan atau audio menjadi teks. Ini tidak hanya mendukung aksesibilitas bagi penyandang disabilitas yang mungkin mengalami kesulitan mendengar, tetapi juga memastikan bahwa informasi yang disampaikan dapat diakses melalui berbagai cara.",
                    style: TextStyle(fontSize: 16, color: Colors.blue[800]),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),

    Expanded(
      child: Container(
        margin: EdgeInsets.only(bottom: 20, top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        width: 350,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 25, right: 20, left: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Apa itu VISILA read?",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.yellow[600],
                        fontWeight: bold),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Column(
                children: [
                  Text(
                    "VISILA Listen adalah fitur yang memungkinkan pengguna mengubah teks menjadi suara. Dengan menggunakan teknologi pengenalan teks ke suara, fitur ini mendukung aksesibilitas bagi mereka yang mungkin mengalami kesulitan membaca atau memahami teks secara tertulis. VISILA Listen menghadirkan dimensi audio untuk memperluas cara konsumsi informasi melalui platform VISILA, menciptakan lingkungan berita yang lebih inklusif.",
                    style: TextStyle(fontSize: 16, color: Colors.blue[800]),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),

    Expanded(
      child: Container(
        margin: EdgeInsets.only(bottom: 20, top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        width: 350,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 25, right: 20, left: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Apa itu VISILA news?",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.yellow[600],
                        fontWeight: bold),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Column(
                children: [
                  Text(
                    "VISILA News adalah sebuah platform berita yang menghadirkan informasi terkini seputar inklusivitas dan pembaruan terkait penyandang disabilitas tunarungu-wicara. Fokusnya adalah memberikan liputan mendalam dan relevan terkait isu-isu yang berkaitan dengan komunitas tersebut, memastikan aksesibilitas informasi untuk semua.",
                    style: TextStyle(fontSize: 16, color: Colors.blue[800]),
                    textAlign: TextAlign.justify,
                  ),
                  
                ],
              ),
            ],
          ),
        ),
      ),
    ),

    

    // Icons.home,
    // Icons.explore,
    // Icons.search,
    // Icons.feed,
    // Icons.post_add,
    // Icons.local_activity,
    // Icons.settings,
    // Icons.person
  ];

  @override
  void initState() {
    super.initState();
    _authGoogle.authStateChanges().listen((event) {
      setState(() {
        _user = event;
      });
    });
  }

  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Container(
        // margin: const EdgeInsets.all(5),
        width: double.infinity,
        height: double.infinity,
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
                            Icon(
                              Icons.question_mark,
                              color: Colors.yellow[700],
                              size: 85,
                            ),
                          ],
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Bantuan VISILA",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: bold),
                              ),
                              Text(
                                "Untuk terjemah bahasa isyaratmu",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: items.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  current = index;
                                });
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: EdgeInsets.all(5),
                                width: 150,
                                height: 45,
                                decoration: BoxDecoration(
                                  color: current == index
                                      ? Colors.white70
                                      : Colors.white54,
                                  borderRadius: current == index
                                      ? BorderRadius.circular(15)
                                      : BorderRadius.circular(10),
                                  // border: current == index
                                  //     ? Border.all(
                                  //         color: Colors.blueAccent, width: 2)
                                  //     : null
                                ),
                                child: Center(
                                  child: Text(
                                    items[index],
                                    style: GoogleFonts.laila(
                                        fontSize: current == index ? 17 : 15,
                                        fontWeight: current == index
                                            ? bold
                                            : FontWeight.w500,
                                        color: current == index
                                            ? Colors.blue[800]
                                            : Colors.grey),
                                  ),
                                ),
                              ),
                            ),
                            Visibility(
                                child: Container(
                              width: 5,
                              height: 5,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                            )),
                          ],
                        );
                      }),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 2),
                  width: double.infinity,
                  height: 445,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        icons[current],
                      ]),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.only(bottom: 5),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 30, bottom: 10),
                        child: Text(
                          "Hubungi kami",
                          style: TextStyle(
                              color: Colors.blue[800],
                              fontWeight: bold,
                              fontSize: 21),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.all(20),
                          color: Colors.white,
                          elevation: 5,
                          minWidth: 10,
                          onPressed: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("animations/whatsapp.png", height: 35, width: 35,)
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),

                        MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.all(20),
                          color: Colors.white,
                          elevation: 5,
                          minWidth: 10,
                          onPressed: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("animations/instagram.png", height: 35, width: 35,)
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),

                        MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.all(20),
                          color: Colors.white,
                          elevation: 5,
                          minWidth: 10,
                          onPressed: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("animations/gmail.png", height: 35, width: 35,)
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),

                        MaterialButton(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.all(20),
                          color: Colors.white,
                          minWidth: 10,
                          onPressed: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("animations/call.png", height: 35, width: 35,)
                              // Icon(
                              //   Icons.account_circle,
                              //   color: Colors.yellow[700],
                              //   size: 32,
                              // ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.home, color: Colors.white),
      //   onPressed: () {},
      //   backgroundColor: Colors.yellow[700],
      //   shape: CircleBorder(),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // bottomNavigationBar: BottomAppBar(
      //   height: 180,
      //   color: Colors.grey.withOpacity(0.5),
      //   shape: CircularNotchedRectangle(),
      //   notchMargin: 10,
      //   child:
      // ),
    );
  }
}
