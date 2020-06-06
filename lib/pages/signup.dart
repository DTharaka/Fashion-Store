import 'package:fashion_store/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fashion_store/services/user.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();

  UserServices _userServices = UserServices();

  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  bool loading = false;
  String gender;
  String groupValue = "male";
  bool hidePassword = true;

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
                            controller: _nameController,
                            decoration: InputDecoration(
                              hintText: "Name",
                              icon: Icon(Icons.person),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Name cannot be empty";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.white.withOpacity(0.4),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: ListTile(
                                    title: Text(
                                      "Male",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    trailing: Radio(
                                        value: "male",
                                        groupValue: groupValue,
                                        onChanged: (e) => valueChanged(e)))),
                            Expanded(
                                child: ListTile(
                                    title: Text(
                                      "Female",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    trailing: Radio(
                                        value: "female",
                                        groupValue: groupValue,
                                        onChanged: (e) => valueChanged(e))))
                          ],
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
                          child: ListTile(
                            title: TextFormField(
                              obscureText: hidePassword,
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
                            trailing: IconButton(
                                icon: Icon(Icons.remove_red_eye),
                                onPressed: () {
                                  setState(() {
                                    hidePassword = false;
                                  });
                                }),
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
                          child: ListTile(
                            title: TextFormField(
                              obscureText: hidePassword,
                              controller: _confirmPasswordController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Confirm Password",
                                icon: Icon(Icons.lock_outline),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "The password field cannot be empty";
                                } else if (value.length < 6) {
                                  return "the password has to be at least 6 characters long";
                                } else if (_passwordTextController.text !=
                                    value) {
                                  return "Passwords do not match";
                                }
                                return null;
                              },
                            ),
                            trailing: IconButton(
                                icon: Icon(Icons.remove_red_eye),
                                onPressed: () {
                                  setState(() {
                                    hidePassword = false;
                                  });
                                }),
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
                            onPressed: () {
                              validateForm();
                            },
                            minWidth: MediaQuery.of(context).size.width,
                            child: Text('Sign Up',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0)),
                          )),
                    ),
                    Padding(
                        padding: EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text('Login',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  color: Colors.blue)),
                        ))
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

  valueChanged(e) {
    setState(() {
      if (e == "male") {
        groupValue = e;
        gender = e;
      } else if (e == "female") {
        groupValue = e;
        gender = e;
      }
    });
  }

  void validateForm() async {
    FormState formState = _formKey.currentState;

    if (formState.validate()) {
      FirebaseUser user = await firebaseAuth.currentUser();
      if (user == null) {
        await firebaseAuth
            .createUserWithEmailAndPassword(
                email: _emailTextController.text,
                password: _passwordTextController.text)
            .then((user) => {
                  _userServices.createUser(user.user.uid, {
                    "username": user.user.displayName,
                    "email": user.user.email,
                    "userId": user.user.uid,
                    "gender": gender
                  })
                })
            .catchError((e) => {print(e.toString())});

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (contxt) => HomePage()));
      }
    }
  }
}
