import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'Screen2.dart';
import 'Screen3.dart';
class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  _Screen1State createState() => _Screen1State();
}


class _Screen1State extends State<Screen1> {
  String password = "";
  String email = "";
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;

  @override
    Widget build(BuildContext context) {
      return MaterialApp(
          home: Scaffold(
              body: SafeArea(
                  child: ModalProgressHUD(
                      inAsyncCall: showSpinner,
                      child: SingleChildScrollView(
                          child: Column(

                              children: <Widget>
                              [
                                SizedBox(height: 80),
                                Image(
                                  image: AssetImage(
                                      'assets/instagram_logo.png'),
                                  width: 340,
                                  height: 60,
                                ),
                                SizedBox(height: 20),
                                SizedBox(height: 40),
                                TextField(
                                  onChanged: (value) {
                                    email = value;
                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Email',
                                  ),
                                ),


                                SizedBox(height: 20),
                                TextField(
                                  onChanged: (value) {
                                    password = value;
                                  },
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Password',
                                  ),
                                ),
                                SizedBox(height: 20),

                                Container(

                                  margin: EdgeInsets.only(left: 180),
                                  child: Text('Forgot Password ?',
                                      style: TextStyle(
                                          fontSize: 25, color: Colors
                                          .blueAccent),
                                      textAlign: TextAlign.end),

                                ),
                                SizedBox(height: 20),
                                FlatButton
                                  (
                                  onPressed: () async
                                  {
                                    setState(() {
                                      showSpinner = true;
                                    });

                                    try {
                                      final user = await _auth
                                          .signInWithEmailAndPassword(
                                          email: email, password: password);


                                      Navigator.pushNamed(context, '/three');
                                      setState(() {
                                        showSpinner = false;
                                      });
                                    }

                                    catch (e) {
                                      print('Email and passwords do not match');
                                    }
                                  },

                                  child: Container(

                                    padding: EdgeInsets.fromLTRB(
                                        130, 17, 50, 10),

                                    color: Colors.blue,
                                    child: Text('Log in', style: TextStyle(
                                        fontSize: 25, color: Colors.white)),
                                    width: 350,
                                    height: 70,

                                  ),

                                ),


                                SizedBox(height: 15),
                                Row(
                                    children: <Widget>[
                                      Expanded(
                                          child: Divider()
                                      ),

                                      Text("OR"),

                                      Expanded(
                                          child: Divider()
                                      ),
                                    ]
                                ),
                                SizedBox(height: 20),

                                Container(
                                  margin: EdgeInsets.only(left: 60),
                                  child: Row(
                                      children: <Widget>[
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'Dont have an account ?',
                                                style: TextStyle(fontSize: 20,
                                                    color: Colors.black45),

                                              ),

                                              TextSpan(
                                                recognizer: new TapGestureRecognizer()
                                                  ..onTap = () {
                                                    Navigator.pushNamed(
                                                        context, '/second');
                                                  },
                                                text: ' Sign Up',
                                                style: TextStyle(fontSize: 20,
                                                    color: Colors.blue),

                                              ),

                                            ],
                                          ),
                                        )
                                      ]
                                  ),
                                ),

                                SizedBox(height: 90),
                                Divider(
                                  height: 2,
                                  thickness: 3,
                                ),
                                SizedBox(height: 30),
                                Container(
                                  child: Text('Instagram OT Facebook',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black26),
                                      textAlign: TextAlign.end),

                                )
                              ]
                          )
                      )
                  )
              )
          )
      );
    }
  }



