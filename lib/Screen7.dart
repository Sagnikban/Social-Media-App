import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
class Screen7 extends StatefulWidget {
  const Screen7({Key? key}) : super(key: key);
  @override
  _Screen7State createState() => _Screen7State();
}

class _Screen7State extends State<Screen7> {
  final _firestore = FirebaseFirestore.instance;
  late var currentUser=_auth.currentUser;
  var _auth=FirebaseAuth.instance;
  late String email="banerjeesagnik29@gmail.com";
  @override
  Widget build(BuildContext context) {
    late String username;
    late String bio="";
    late String password="ar";
    late String uid="a";
    bool showSpinner = false;

    return MaterialApp(
        home: Scaffold(
        body:SafeArea(
      child:ModalProgressHUD(
       inAsyncCall:showSpinner ,
        child:SingleChildScrollView(
        child: Column(
        children: <Widget>
        [

           SizedBox(height:40),
              TextField(
              onChanged: (value){
              username=value;
                },
                             decoration: InputDecoration(
                            border: OutlineInputBorder(),
    labelText: 'Enter new username',
    ),
    ),
    SizedBox(height:10),





         SizedBox(height:30),
             TextField(

                onChanged:(value){
                    bio=value;
                   },
               maxLines: 3,
            maxLength: 75,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Update Bio'
            ),

          ),

           SizedBox(height:70),

          FlatButton
            (
            onPressed: () async
            {
              _auth.sendPasswordResetEmail(email:currentUser!.email!);


            },

            child: Container(

              padding: EdgeInsets.fromLTRB(
                  40, 21, 50, 10),

              color: Colors.pinkAccent,
              child: Text('Click to change password', style: TextStyle(
                  fontSize: 20, color: Colors.white)),
              width: 350,
              height: 70,

            ),

          ),


    SizedBox(height:140),


          FlatButton
            (
            onPressed: () async
            {
              setState(() {
                showSpinner = true;
              });

              

              var userCredential;
              _firestore.collection('users').doc(_auth.currentUser!.uid).update({
                'username':username!,
                'bio':bio!,

              }   );

                Navigator.pushNamed(context, '/first');
                setState(() {
                  showSpinner = false;
                });

            },

            child: Container(

              padding: EdgeInsets.fromLTRB(
                  80, 17, 50, 10),

              color: Colors.blue,
              child: Text('Update details', style: TextStyle(
                  fontSize: 25 , color: Colors.white)),
              width: 350,
              height: 70,

            ),

          ),
          ]
        )
        )
         )
        )
        )
    );
  //  )

  }
  }



