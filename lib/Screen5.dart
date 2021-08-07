import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import  'dart:io';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'Screen2.dart';
import 'Screen3.dart';
import 'Screen4.dart';
import 'Screen5.dart';
import 'SCreen7.dart';
import 'Screen8.dart';
class  Screen5 extends StatefulWidget {
  const Screen5(
      {Key? key})
      : super(key: key);
  @override
  _Screen5State createState() => _Screen5State();
}

class _Screen5State extends State<Screen5> {
  var _auth = FirebaseAuth.instance;
  late  String username="sagnik";
  late String bio="";
  final _firestore = FirebaseFirestore.instance;
  final picker = ImagePicker();
  late String uid="";
  late int followers=0;
  late var currentUser = _auth.currentUser;

   getdetails () async {
    if (currentUser != null) {
       uid = await currentUser!.uid;
      await FirebaseFirestore.instance
          .collection('users')
          .where('uid', isEqualTo: uid)
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
        setState(() {
          username = doc['username'];
          bio=doc['bio'];
          followers=doc['followers'];

        });
        });
      });

    }
  }

  Future getImage1(var pickedFile) async
  {
    try{
      if (pickedFile != null) {
        File file = File(pickedFile.path);
       firebase_storage.Reference firebaseStorageRef = await firebase_storage
            .FirebaseStorage.instance
            .ref()
            .child('users/${uid}');
         var uploadTask = firebaseStorageRef.putFile(file);
        await uploadTask.whenComplete(() async {
          String photoURL = await firebase_storage.FirebaseStorage.instance
              .ref('users/${uid}')
              .getDownloadURL();
          _firestore.collection('users').doc(_auth.currentUser!.uid).update({
            'photoURL': photoURL!,
          });
        });
      }
    }
    catch(e)
    {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getdetails();
  }

  @override
  Widget build(BuildContext context) {
    Future<dynamic> addfile() async {
      return showDialog(context: context,
          builder:(context){
            return Dialog(
                child:Padding(  padding: EdgeInsets.symmetric(
                  vertical: 10,),
                    child:Column(
                        children: <Widget>[
                          FlatButton(
                            child:Text('Click to upload from camera'),
                            onPressed: () async
                            {
                              var pickedFile1 =
                              await picker.getImage(source: ImageSource.camera);
                              print("The path is");
                              print(pickedFile1!.path);
                              getImage1(pickedFile1);
                             // Navigator.pushNamed(context,'/second');
                            },
                          ),
                          FlatButton
                            (
                            child:Text('Click to upload from gallery'),
                            onPressed: () async{
                              var pickedFile =
                              await picker.getImage(source: ImageSource.gallery);
                              getImage1(pickedFile);
                             // Navigator.pushNamed(context,'/second');
                            },
                          ),
                        ]
                    )
                )
            );
          }
      );
    }
    return MaterialApp(
    home:Scaffold(
    body: SingleChildScrollView(
      child: Column(
        children:<Widget>[
          SizedBox(height:30),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children:<Widget>[
              FlatButton(
                  onPressed:()
                  {
                    Navigator.pushNamed(context,'/second');
                  },
                child: Container(
                  width:120,height:40,
                  padding: EdgeInsets.fromLTRB(28,8,30,10),


                  child:Text('Log Out',style:TextStyle(fontSize:15,color:Colors.white)),
                  decoration: BoxDecoration(
                    color:Colors.pinkAccent,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                      topLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),

                  ),

                ),

              ),


            ]
          ),


          SizedBox(height:10),
          StreamBuilder<QuerySnapshot>(


            stream:  FirebaseFirestore.instance.collection('users').where('uid',isEqualTo:currentUser!.uid ).snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot)  {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }
              else if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }
              else {
                  return new Container(
                      child: Column(
                          children: <Widget>[
                            Container(
                                child: Column(
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Column(
                                             crossAxisAlignment:CrossAxisAlignment.start,
                                             children: <Widget>
                                            [
                                              Container(height:10),
                                              Row(
                                                children:<Widget>[
                                                  Container(width:10),
                                                  Text("                                       ${   username}"),
                                                  Container(width:10),
                                                ]
                                              ),
                                              Container(height:40),
                                              Row(
                                                children:<Widget>[
                                                  Stack(
                                                    children:<Widget>[

                                                      Container(
                                                        padding:EdgeInsets.only(left:20),

                                                        child: CircleAvatar(

                                                          radius: 30,
                                                          child: Positioned(
                                                              child: InkWell(
                                                                  onTap: () {
                                                                    addfile();
                                                                  },
                                                                  child: Icon(
                                                                    Icons.camera_alt,
                                                                    color: Colors.teal,
                                                                    size: 20,

                                                                  )
                                                              )
                                                          ),

                                                          backgroundImage: NetworkImage(snapshot.data!.docs[0]['photoURL']),

                                                        ),),

                                                    ]
                                                  ),


                                                     Container(
                                                       width:28,
                                                     ),
                                                   Container(
                                                width: 50,
                                                child: Text('  54 posts'),
                                              ),
                                              Container(width: 20),
                                              Container(
                                                width: 80,
                                                child: Text('      ${followers} followers'),
                                              ),
                                              Container(width: 10),
                                              Container(
                                                width: 80,
                                                child: Text('    162  following'),
                                              ),


                                                ]
                                              ),

                                             SizedBox(height:20),
                                              Row(
                                                  children: <Widget>
                                                  [
                                                    Text("   ${username}"),
                                                  ]
                                              ),
                                              SizedBox(height:10),
                                              Row(
                                                  children: <Widget>
                                                  [
                                                    Text('   ${bio}'),
                                                  ]
                                              ),
                                            ]

                                        ),

                                    ]
                                )
                            )


                          ]
                      )

                  );
             //   });
              }

              },
          ),
          SizedBox(height:20),

          Row(
            children:<Widget>[
              SizedBox(width:13),

              FlatButton(
                onPressed:()
                    {
                      _firestore.collection('users').doc(_auth.currentUser!.uid).update({
                        'followers':followers+1,

                      }   );
                      Navigator.pushNamed(context,'/eight');
                    },
                child: Container(
                  width:150,height:40,
                  padding: EdgeInsets.fromLTRB(43,8,40,10),


                  child:Text('Follow',style:TextStyle(fontSize:18,color:Colors.white)),
                    decoration: BoxDecoration(
                      color:Colors.blue,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                border: Border.all(

                color: Colors.blue,
                    style: BorderStyle.solid
                ),
    ),

                ),
              ),
              SizedBox(width:15),
              FlatButton(
                onPressed:()
                {

                },
                child: Container(
                  width:150,height:40,
                  padding: EdgeInsets.fromLTRB(33,8,30,7),


                  child:Text('Message',style:TextStyle(fontSize:18,color:Colors.grey)),
                  decoration: BoxDecoration(
                    color:Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                      topLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                    border: Border.all(
                        color: Colors.grey,
                        style: BorderStyle.solid
                    ),
                  ),

                ),
              )


            ]
          ),




          Column(
              children:<Widget>[
                SizedBox(height:30),

                FlatButton
                  (

                  onPressed:()
                  {
                    Navigator.pushNamed(context,'/seven');
                  },

                  child:  Container(


                    padding: EdgeInsets.fromLTRB(100,17,50,10),


                    child:Text('Edit profile',style:TextStyle(fontSize:25,color:Colors.black26)),
                    width:350,
                    height:70,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey,
                          style: BorderStyle.solid
                      ),
                    ),

                  ),

                ),
                SizedBox(height:10),


               Container(
                 height:400,


                 child:StreamBuilder<QuerySnapshot>(

                     stream:FirebaseFirestore.instance.collection('posts').
                      doc(_auth.currentUser!.uid).collection('userposts').snapshots(),
                     builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot)  {
                     if(FirebaseFirestore.instance.collection('posts').
                     doc(_auth.currentUser!.uid).collection('userposts').snapshots()!=null)
                       {
                         if (snapshot.hasError) {
                           return Text('Something went wrong');
                         }
                         if (snapshot.connectionState == ConnectionState.waiting) {
                           return Text("Loading");
                         }
                         return new GridView.builder(
                           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                             crossAxisCount: 3,
                             crossAxisSpacing: 5.0,
                             mainAxisSpacing: 5.0,
                           ),
                           itemCount:snapshot.data!.docs.length,
                           itemBuilder: (BuildContext context, int index) {
                             return Container
                               (
                               child: Container(
                                 width: MediaQuery
                                     .of(context)
                                     .size
                                     .width / 3,
                                 height: 300,
                                 decoration: BoxDecoration(
                                   image: DecorationImage(
                                     fit: BoxFit.fill,
                                     image: NetworkImage(
                                         snapshot.data!.docs[index]['url']),
                                   ),
                                 ),
                               ),
                             );
                           },
                         );
                       }
                     else
                       return Text('No posts yet');

                   } ,
                 )
               )

              ]
          ),
        ]
      ),
    ),

      bottomNavigationBar: Row(
        children:<Widget>[

          Container(
              width:MediaQuery.of(context).size.width/5,
              child:IconButton(
                onPressed:()
                {
                  Navigator.pushNamed(context,'/three');
                },
                icon: Icon(Icons.home),
              )


          ),


          Container(
              width:MediaQuery.of(context).size.width/5,
              child:IconButton(
                onPressed:()
                {
                  Navigator.pushNamed(context,'/four');
                },
                icon: Icon(Icons.search),
              )
          ),
          Container(
            width:MediaQuery.of(context).size.width/5,

            child:Icon(Icons.add_box),

          ),

          Container(
              width:MediaQuery.of(context).size.width/5,
              child:IconButton(
                onPressed:()
                {

                },
                icon: Icon(Icons.favorite),
              )
          ),


          Container(
            width:MediaQuery.of(context).size.width/5,
            child:FlatButton(
              onPressed:()
              {
                Navigator.pushNamed(context,'/five');
              },

              child:StreamBuilder<QuerySnapshot>(

                stream:  FirebaseFirestore.instance.collection('users').where('uid',isEqualTo:currentUser!.uid ).snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  else if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading");
                  }

                  else return new Container(
                      child:CircleAvatar
                        (
                        radius:20,
                        backgroundImage:NetworkImage(snapshot.data!.docs[0]['photoURL']),
                      ),

                    );
                },
              ),
            ),


          )

        ],
      ),

    )

    );
  }



}
