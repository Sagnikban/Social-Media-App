import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'Screen3.dart';
import 'Screen4.dart';
import 'Screen5.dart';
class Screen3 extends StatefulWidget {
  const Screen3({Key? key}) : super(key: key);
  @override
  _Screen3State createState() => _Screen3State();
}
class _Screen3State extends State<Screen3> {
  late File _image;
  late  String username="sagnik";
  late String bio="";
  late String uid="";
  var _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final picker = ImagePicker();
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('allposts').snapshots();

  getdetails () async {
    //getting the data from firebase
    late var currentUser = _auth.currentUser;
    if (currentUser != null) {
      try {
        var uid = await currentUser!.uid;
        await FirebaseFirestore.instance
            .collection('users')
            .where('uid', isEqualTo: uid)
            .get()
            .then((QuerySnapshot querySnapshot) {
          querySnapshot.docs.forEach((doc) {
            setState(() {
              username = doc['username'];
              bio = doc['bio'];
              uid=doc['uid'];
            });
          });
        });
      }
      catch(e)
      {
        print(e);
      }
    }
  }
  @override
  void initState() {
    super.initState();
    getdetails();
  }
  //storing the image in firestore storage
  Future getImage1(String username, String profileURL, String name, String bio,
      String uid, var pickedFile) async
  {
    try{
      var collectionRef = FirebaseFirestore.instance.collection('posts');
     var collectionRef2 = FirebaseFirestore.instance.collection('allposts');
     if (pickedFile != null) {
      var time = DateTime.now();
      String postid = '${name}_${time}';
      File file = File(pickedFile.path);
      firebase_storage.Reference firebaseStorageRef = await firebase_storage
          .FirebaseStorage.instance
          .ref()
          .child('posts/${uid}/${postid}');
      var uploadTask = firebaseStorageRef.putFile(file);
      await uploadTask.whenComplete(() async {
        String photoURL = await firebase_storage.FirebaseStorage.instance
            .ref('posts/${uid}/${postid}')
            .getDownloadURL();
        Map<String, dynamic> postdata = {
          'who_posted': username,
          'name': name,
          'caption': bio,
          'url': photoURL,
          'time': time,
          'who_posted_url': profileURL,
        };
        await collectionRef
            .doc('sagnik')
            .collection('userposts')
            .doc('sagnik')
            .set(postdata);
        await collectionRef2.add(postdata);
        _firestore.collection('users').doc('sagnik').set({
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
  Widget build(BuildContext context) {
   //Capturing image from gallery or camera
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
                     getImage1(username,username,username,bio,uid,pickedFile1);
                     Navigator.pushNamed(context,'/three');
                     },
                    ),
                    FlatButton
                      (
                      child:Text('Click to upload from gallery'),
                      onPressed: () async{
                        var pickedFile =
                        await picker.getImage(source: ImageSource.gallery);
                        print("The path is");
                        print(pickedFile!.path);
                        print(username);
                        print(bio);
                        print(uid);
                        getImage1(username,username,username,bio,uid,pickedFile);
                        Navigator.pushNamed(context,'/three');
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
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Icon(Icons.camera_alt_outlined,color: Colors.black87),

          title: Text('    Instagram',style: TextStyle(
            color: Colors.black87,
            fontSize: 50,
            fontFamily: 'Billabong',
            fontStyle: FontStyle.italic,
          ),),
          actions:<Widget> [
            IconButton(
              onPressed:(){
                Navigator.pushNamed(context,'/six');
               },
               icon:Icon(Icons.send,color:Colors.black87),
            )
          ],

        ),


        body:StreamBuilder<QuerySnapshot>(
              stream: _usersStream,
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
                }

               if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                 }

    return new ListView(
    children: snapshot.data!.docs.map((DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    return Container(


       height:500,width:500,
       child:Image(
         image:NetworkImage(data['url']),
       )

    );
    }).toList(),
    );},


    /*      initialData: Column(
            children: <Widget>
            [

              SingleChildScrollView(

                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: <Widget>[
                        Divider(
                          height:2,
                          thickness:3,
                        ),
                        SizedBox(height:5),
                        CircleAvatar(
                          radius:48,

                          backgroundImage:AssetImage('assets/OIP.jfif'),

                        ),

                        SizedBox(width:10),
                        CircleAvatar(
                          radius:48,
                          backgroundImage:AssetImage('assets/R (3).jfif'),
                        ),
                        SizedBox(width:10),
                        CircleAvatar(
                          radius:48,
                          backgroundImage:AssetImage('assets/R (2).jfif'),
                        ) ,
                        SizedBox(width:10),

                        CircleAvatar(
                          radius:48,
                          backgroundImage:AssetImage('assets/R (1).jfif'),

                        ),


                        SizedBox(width:10),
                        CircleAvatar(
                          radius:48,

                          backgroundImage:AssetImage('assets/cute-tiger-cub-enrique-mendez.jpg'),
                        ),


                        SizedBox(width:10),

                      ]
                  )
              ),
              Divider(
                height:2,
                thickness:3,
              ),
              Container(
                height:6,
              ),



            ],
          ),
*/

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

                child:IconButton(
                  onPressed: () {
                    addfile();

                  },

                  icon: Icon(Icons.add_box_outlined),
                )


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

                child :CircleAvatar(
                  radius:15,

                  backgroundImage:AssetImage('assets/OIP.jfif'),


                ),
              ),


            )

          ],
        ),
      ));




  }
}

