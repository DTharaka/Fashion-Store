import 'package:fashion_store/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  SharedPreferences preferences;
  bool loading = false;
  bool isLogedIn = false;

  @override
  void initState() {
    super.initState(); // Call the initial state of base class
    isSignedIn();
  }

  void isSignedIn() async {
    setState(() {
      loading = true;
    });

    if (isLogedIn) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (contxt) => HomePage()));
    }

    setState(() {
      loading = false;
    });
  }

  // Future handleSignIn() async {
  //   preferences = await SharedPreferences.getInstance();

  //   setState(() {
  //     loading = true;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Image.asset('assets/login_back_4.jpeg',
            fit: BoxFit.fill, height: double.infinity, width: double.infinity),
        Container(
          color: Colors.black.withOpacity(0.4),
          height: double.infinity,
          width: double.infinity,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 200.0),
          child: Center(
            child: Form(
                key: _formKey,
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white.withOpacity(0.8),
                        elevation: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: TextFormField(
                            controller: _emailTextController,
                            decoration: InputDecoration(
                              hintText: "Email",
                              icon: Icon(Icons.email),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value.isEmpty) {
                                Pattern pattern =
                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                RegExp regex = RegExp(pattern);

                                if (!regex.hasMatch(value)) {
                                  return 'Please make sure email is valid';
                                } else {
                                  return null;
                                }
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white.withOpacity(0.8),
                        elevation: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: TextFormField(
                            controller: _passwordTextController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Password",
                              icon: Icon(Icons.lock_outline),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return "The password field cannot be empty";
                              } else if (value.length < 6) {
                                return "the password has to be at least 6 characters long";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.red.withOpacity(0.9),
                          elevation: 0.0,
                          child: MaterialButton(
                            onPressed: () {},
                            minWidth: MediaQuery.of(context).size.width,
                            child: Text('Login',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0)),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text('Forgot Password',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                              color: Colors.white)),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUp()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text('Sign up',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.blue)),
                          )),
                    )
                  ],
                )),
          ),
        ),
        Visibility(
            visible: loading ?? true,
            child: Center(
              child: Container(
                alignment: Alignment.center,
                color: Colors.white.withOpacity(0.9),
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red)),
              ),
            ))
      ]),
    );
  }
}
