import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Screen1.dart';
class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);
  @override
  _Screen2State createState() => _Screen2State();
}
class _Screen2State extends State<Screen2> {
  final _firestore = FirebaseFirestore.instance;
  var _auth=FirebaseAuth.instance;
  late var currentUser=_auth.currentUser;
  late String email;
  late String password;
  late String username;
  bool showSpinner=false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:SafeArea(
          child:ModalProgressHUD(
        inAsyncCall:showSpinner ,
        child:SingleChildScrollView(
          child: Column(
            children: <Widget>
            [
              Image(
                image: AssetImage('assets/instagram_logo.png'),
                width: 340,
                height: 60,

              ),
              SizedBox(height:40),
              TextField(
                onChanged: (value){
                  username=value;
                  },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
              SizedBox(height:10),
              TextField(
                onChanged:(value){
                  password=value;
                },
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              SizedBox(height:10),
              TextField(

                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Confirm Password'
                ),
              ),
              SizedBox(height:10),

              TextField(
                onChanged:(value){
                  email=value;
                },
                keyboardType:TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email ID'
                ),
              ),
              SizedBox(height:20),
              FlatButton(
                onPressed:()async{
                  setState(() {
                    showSpinner=true;
                  });
                  try {
                  await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);

                       Navigator.pushNamed(context,'/first');
                       setState(() {
                     showSpinner=false;
                   });
                  }
                  catch(e){
                    print(e);
                  }
                            _firestore.collection('users').add({
                                     'email':currentUser!.email!,
                                     'username':username!,
                            }   );
                },
                child:Container(

                  padding: EdgeInsets.fromLTRB(130,17,50,10),
                  margin: EdgeInsets.only(left:10),

                  color: Colors.blue,
                  child:Text('Sign Up',style:TextStyle(fontSize:25,color:Colors.white)),
                  width:350,
                  height:70,

                ),
              ),

              SizedBox(height:35),
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
              SizedBox(height:20),


              Container(
                margin: EdgeInsets.only(left:60),
                child: Row(
                    children: <Widget>[
                      RichText(
                        text:TextSpan(
                          children:[
                            TextSpan(
                              text:'Already have an account ?',style:TextStyle(fontSize:20,color: Colors.black45),

                            ),

                            TextSpan(
                              recognizer: new TapGestureRecognizer()
                                ..onTap = ( ){Navigator.pushNamed(context, '/first');},
                              text: ' Log In', style: TextStyle(fontSize:20,color: Colors.blue),

                            ),

                          ],
                        ),
                      )
                    ]
                ),
              ),

              SizedBox(height:90),
              Divider(
                height:2,
                thickness:3,
              ),
              SizedBox(height:30),
              Container(
                child:Text('Instagram OT Facebook',style:TextStyle(fontSize:20,color:Colors.black26),
                    textAlign: TextAlign.end),

              )





            ],
          ),
        ),
      ),
      ),
      ),
    );
  }
}
