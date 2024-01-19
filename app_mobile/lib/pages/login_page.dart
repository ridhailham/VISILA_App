import 'package:app_mobile/pages/home_page.dart';
import 'package:app_mobile/pages/register_page.dart';
import 'package:app_mobile/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_button/sign_in_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final FirebaseAuth _authGoogle = FirebaseAuth.instance;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _isObscure = true;

  User? _user;

  @override
  void initState() {
    super.initState();
    _authGoogle.authStateChanges().listen((event) {
      setState(() {
        _user = event;
      });

      if (_user != null) {
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          Navigator.pushReplacementNamed(context, '/home');
        });
      }
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              SizedBox(height: 30),
              
              // Text((_user?.email ?? "")),
              Text("Welcome.",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow[700])),
              Text("Sign in to continue", style: TextStyle(fontSize: 17)),
              SizedBox(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("animations/welcoming.png"),
                ],
              ),
              SizedBox(height: 20),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.yellow,
                          ),
                        ),
                        hintText: "Email or Username",
                        hintStyle: TextStyle(
                          fontSize: 17,
                          color: Colors.grey[600],
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.yellow)),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(
                          fontSize: 17,
                          color: Colors.grey[600],
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                        suffixIcon: IconButton(
                          icon: Icon(_isObscure
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.yellow), // Warna border saat diisi
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Forgot Password ?",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue))
                ],
              ),
              SizedBox(height: 5),
              Container(
                height: 45,
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 15),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    side: BorderSide(color: Colors.blue),
                  ),
                  onPressed: _signIn,
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.black,
                      // fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "or sign in with",
                    style: TextStyle(color: Colors.grey[700], fontSize: 16),
                  ),
                ],
              ),

              Container(
                height: 45,
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 13),
                child: SignInButton(
                  Buttons.google,
                  text: "Sign up with Google",
                  onPressed: () {
                    _handleGoogleSignIn();
                  },
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? ",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[600],
                        // fontWeight: FontWeight.bold
                      )),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: Text("Sign up here.",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.yellow[700],
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }

  void _signIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    if (user != null) {
      print("User is successfully signed in");
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      print("Some error happened");
    }
  }

  void _handleGoogleSignIn() async {
    try {
      GoogleAuthProvider _googleAuthProvider = GoogleAuthProvider();
      UserCredential userCredential =
          await _authGoogle.signInWithProvider(_googleAuthProvider);

      // Autentikasi berhasil, pindah ke halaman beranda
      User? user = userCredential.user;
      if (user != null) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        print("User is null after Google sign-in");
      }
    } catch (error) {
      print("Error during Google sign-in: $error");
      // Tambahkan penanganan kesalahan sesuai kebutuhan
    }
  }

  
}
