import 'package:flutter/material.dart';
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
import 'Screen4.dart';
import 'Screen5.dart';
import 'Screen7.dart';
import 'Screen8.dart';
import 'Screen9.dart';
class Screen10 extends StatefulWidget {
  const Screen10({Key? key,required this.uid }) : super(key: key);
  final String uid;
  @override
  _Screen10State createState() => _Screen10State();
}
class _Screen10State extends State<Screen10> {
  var _auth = FirebaseAuth.instance;
  late  String username="sagnik";
  late String bio="";
  final _firestore = FirebaseFirestore.instance;
  final picker = ImagePicker();
  late int followers=0;
  late int following=0;
  late var currentUser = _auth.currentUser;
  getdetails () async {
    if (currentUser != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .where('uid', isEqualTo: widget.uid)
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          setState(() {
            username = doc['username'];
            bio=doc['bio'];
            followers=doc['followers'];
            following=doc['following'];

          });
        });
      });

    }
  }


  @override
  void initState() {
    super.initState();
    getdetails();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        home:Scaffold(
          body: SingleChildScrollView(
            child: Column(
                children:<Widget>[
                  SizedBox(height:30),


                  StreamBuilder<QuerySnapshot>(

                    stream:  FirebaseFirestore.instance.collection('users').where('uid',isEqualTo:widget.uid ).snapshots(),
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
                                                          child: Text('    ${following} following'),
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
                            _firestore.collection('users').doc(widget.uid).update({
                              'followers':followers-1,

                            }   );
                            _firestore.collection('users').doc(_auth.currentUser!.uid).update({
                              'following':following-1,

                            }   );
                            Navigator.push(context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Screen9(uid:widget.uid)
                                )

                            );
                          },
                          child: Container(
                            width:150,height:40,
                            padding: EdgeInsets.fromLTRB(33,8,30,10),


                            child:Text('Unfollow',style:TextStyle(fontSize:18,color:Colors.white)),
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

                        SizedBox(height:10),


                        Container(
                            height:400,


                            child:StreamBuilder<QuerySnapshot>(

                              stream:FirebaseFirestore.instance.collection('posts').
                              doc(widget!.uid).collection('userposts').snapshots(),
                              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot)  {
                                if(FirebaseFirestore.instance.collection('posts').
                                doc(widget.uid).collection('userposts').snapshots()!=null)
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

