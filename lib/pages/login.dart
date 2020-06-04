import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  SharedPreferences preferences;
  bool loading = false;
  bool isLogedIn = false;

  @override
  void initState() {
    super.initState(); // Call the initial state of base class
    isSignedIn();
    }

      void isSignedIn() async{
        setState(() {
          loading = true;
        });

        preferences = await SharedPreferences.getInstance();
        isLogedIn = await GoogleSignIn().isSignedIn();

        if (isLogedIn) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (contxt)=> HomePage()));
        }

        setState(() {
          loading = false;
        });
      }

      Future handleSignIn() async{
        preferences = await SharedPreferences.getInstance();

        setState(() {
          loading = true;
        });

        GoogleSignInAccount googleUser = await googleSignIn.signIn();
        GoogleSignInAuthentication googleSignInAuthentication = await googleUser.authentication;
        FirebaseUser firebaseUser = await firebaseAuth.signInWithGoogle(
          idToken: googleSignInAuthentication.idToken , 
          accessToken: googleSignInAuthentication.accessToken
        );

        if (firebaseUser != null) {
          final QuerySnapshot result = await Firestore.instance.collection("users").where("id", isEqualTo: firebaseUser.uid).getDocuments();
          final List<DocumentSnapshot> documents = result.documents;

          if (documents.length == 0) {
            // Insert the user to collection
            Firestore.instance.collection("users").document(firebaseUser.uid).setData(
              {
                "id": firebaseUser.uid,         
                "username": firebaseUser.displayName, 
                "profilePictue": firebaseUser.photoUrl
              }
            );
          } else {
          }
        } else {
        }

      }
      
      @override
      Widget build(BuildContext context) {
        return Container(
           
        );
      }
}