import 'dart:io';
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
  final picker = ImagePicker();
  getdetails () async {
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
              uid = doc['uid'];
            });
          });
        });
      }
      catch(e)
      {
        print('Error1');
      }
    }


  }

  @override
  void initState() {
    super.initState();
    getdetails();
  }


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
            .doc(uid)
            .collection('userposts')
            .doc(postid)
            .set(postdata);
        await collectionRef2.add(postdata);
      });
    }
  }
  catch(e)
    {
      print('Error2');
    }
    }

  @override
  Widget build(BuildContext context) {

    Future<dynamic> addfile() async {

      return showDialog(context: context,

          builder:(context){

            return Dialog(

              child:Padding(  padding: EdgeInsets.symmetric(
                vertical: 10,
              ),
                child:Column(
                  children: <Widget>[

                    FlatButton(
                      child:Text('Click to upload from camera'),
                   onPressed: ()
                   {


                   },
                    ),
                    FlatButton(
                      child:Text('Click to upload from gallery'),
                      onPressed: () async{

                        var pickedFile =
                        await ImagePicker.pickImage(source: ImageSource.gallery);
                        getImage1(username,username,username,bio,uid,pickedFile);

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
        body:Container(

          child: Column(
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
              Expanded(

                child: ListView.builder(


                  // controller: _scrollController,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(

                      child: Column(
                        children: <Widget>
                        [

                       /*   Column(
                              crossAxisAlignment: CrossAxisAlignment
                                  .start,
                              children: <Widget>[
                                Row(
                                  children:<Widget>[
                                    CircleAvatar
                                      (
                                      radius: 30,
                                      backgroundImage: AssetImage(
                                          'assets/OIF.jfif'),
                                    ),

                                    Text('   Mr.360',style:TextStyle(fontSize: 25,color:Colors.black)),
                                  ],
                                ),
                                Container(height:6),
                                Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage
                                        (fit: BoxFit.fill,
                                          image: AssetImage(
                                              'assets/18abdv.jpg'))),
                                  width: 600,
                                  height:320,
                                ),
                                Container(height:15),
                                Row(
                                    children:<Widget>[
                                      IconButton(
                                        onPressed:()
                                        {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(content: Text('You liked this post')));
                                        },
                                        icon:Icon(Icons.favorite_border,color: Colors.pink,),


                                      ),
                                      Container(width:10),
                                      Icon(Icons.chat_bubble_outline),
                                      Container(width:10),
                                      Icon(Icons.share),

                                    ]
                                ),
                                Container(height:5),
                                Row(
                                    children:<Widget>[
                                      CircleAvatar
                                        (
                                        radius: 15,
                                        backgroundImage: AssetImage(
                                            'assets/R (1).jfif'),
                                      ),

                                      Text('  Liked by craig_love and 44,686 others',style:TextStyle(fontSize: 15,color:Colors.black)),

                                    ]
                                ),
                                Container(height:10),
                                Row(
                                    children:<Widget>[


                                      Text('Mr.360  Had a great day on the field !',style:TextStyle(fontSize: 15,color:Colors.black)),

                                    ]
                                )
                              ]
                          ),
                          Container(
                            height:40,
                          ),

                          Column(
                              crossAxisAlignment: CrossAxisAlignment
                                  .start,
                              children: <Widget>[
                                Row(
                                  children:<Widget>[
                                    CircleAvatar
                                      (
                                      radius: 30,
                                      backgroundImage: AssetImage(
                                          'assets/rohit_sharma_1572353374.jpg'),
                                    ),

                                    Text('   Hitman',style:TextStyle(fontSize: 25,color:Colors.black)),
                                  ],
                                ),
                                Container(height:15),
                                Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage
                                        (fit: BoxFit.fill,
                                          image: AssetImage(
                                              'assets/rohit_sharma_1572353374.jpg'))),
                                  width: 600,
                                  height:320,
                                ),
                                Container(height:15),
                                Row(
                                    children:<Widget>[
                                      Icon(Icons.favorite_border,color: Colors.pink,),
                                      Container(width:10),
                                      Icon(Icons.chat_bubble_outline),
                                      Container(width:10),
                                      Icon(Icons.share),

                                    ]
                                ),
                                Container(height:10),
                                Row(
                                    children:<Widget>[
                                      CircleAvatar
                                        (
                                        radius: 15,
                                        backgroundImage: AssetImage(
                                            'assets/R (1).jfif'),
                                      ),

                                      Text('  Liked by craig_love and 44,686 others',style:TextStyle(fontSize: 15,color:Colors.black)),

                                    ]
                                ),
                                Container(height:10),
                                Row(
                                    children:<Widget>[


                                      Text('Hitman  Had a great day on the field !',style:TextStyle(fontSize: 15,color:Colors.black)),

                                    ]
                                )
                              ]
                          ),



                          Container(
                            height:40,
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment
                                  .start,
                              children: <Widget>[
                                Row(
                                  children:<Widget>[
                                    CircleAvatar
                                      (
                                      radius: 30,
                                      backgroundImage: AssetImage(
                                          'assets/f59e0e9e-ad66-43c8-ab41-236e0227f0ab.jpg'),
                                    ),

                                    Text('   Virat Kohli',style:TextStyle(fontSize: 25,color:Colors.black)),
                                  ],
                                ),
                                Container(height:15),
                                Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage
                                        (fit: BoxFit.fill,
                                          image: AssetImage(
                                              'assets/f59e0e9e-ad66-43c8-ab41-236e0227f0ab.jpg'))),
                                  width: 600,
                                  height:320,
                                ),
                                Container(height:15),
                                Row(
                                    children:<Widget>[
                                      Icon(Icons.favorite_border,color: Colors.pink,),
                                      Container(width:10),
                                      Icon(Icons.chat_bubble_outline),
                                      Container(width:10),
                                      Icon(Icons.share),

                                    ]
                                ),
                                Container(height:10),
                                Row(
                                    children:<Widget>[
                                      CircleAvatar
                                        (
                                        radius: 15,
                                        backgroundImage: AssetImage(
                                            'assets/R (1).jfif'),
                                      ),

                                      Text('  Liked by craig_love and 44,686 others',style:TextStyle(fontSize: 15,color:Colors.black)),

                                    ]
                                ),
                                Container(height:10),
                                Row(
                                    children:<Widget>[


                                      Text('Virat Kohli The king is back !',style:TextStyle(fontSize: 15,color:Colors.black)),

                                    ]
                                )
                              ]
                          ),
                          Container(
                            height:40,
                          ),




                          Container(
                            height:40,
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment
                                  .start,
                              children: <Widget>[
                                Row(
                                  children:<Widget>[
                                    CircleAvatar
                                      (
                                      radius: 30,
                                      backgroundImage: AssetImage(
                                          'assets/Cristiano-Ronaldo-Wins-Euro-2020-Golden-Boot1.jpg'),
                                    ),

                                    Text('   CR7',style:TextStyle(fontSize: 25,color:Colors.black)),
                                  ],
                                ),
                                Container(height:15),
                                Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage
                                        (fit: BoxFit.fill,
                                          image: AssetImage(
                                              'assets/Cristiano-Ronaldo-Wins-Euro-2020-Golden-Boot1.jpg'))),
                                  width: 600,
                                  height:320,
                                ),
                                Container(height:15),
                                Row(
                                    children:<Widget>[
                                      Icon(Icons.favorite_border,color: Colors.pink,),
                                      Container(width:10),
                                      Icon(Icons.chat_bubble_outline),
                                      Container(width:10),
                                      Icon(Icons.share),

                                    ]
                                ),
                                Container(height:10),
                                Row(
                                    children:<Widget>[
                                      CircleAvatar
                                        (
                                        radius: 15,
                                        backgroundImage: AssetImage(
                                            'assets/R (1).jfif'),
                                      ),

                                      Text('  Liked by craig_love and 44,686 others',style:TextStyle(fontSize: 15,color:Colors.black)),

                                    ]
                                ),
                                Container(height:10),
                                Row(
                                    children:<Widget>[


                                      Text('CR7 One more feather to the cap !',style:TextStyle(fontSize: 15,color:Colors.black)),

                                    ]
                                )
                              ]
                          ),
                          Container(
                            height:40,
                          ),


                          Column(
                              crossAxisAlignment: CrossAxisAlignment
                                  .start,
                              children: <Widget>[
                                Row(
                                  children:<Widget>[
                                    CircleAvatar
                                      (
                                      radius: 30,
                                      backgroundImage: AssetImage(
                                          'assets/bg,f8f8f8-flat,750x,075,f-pad,750x1000,f8f8f8.jpg'),
                                    ),

                                    Text('   Cheems',style:TextStyle(fontSize: 25,color:Colors.black)),
                                  ],
                                ),
                                Container(height:15),
                                Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage
                                        (fit: BoxFit.fill,
                                          image: AssetImage(
                                              'assets/bg,f8f8f8-flat,750x,075,f-pad,750x1000,f8f8f8.jpg'))),
                                  width: 600,
                                  height:320,
                                ),
                                Container(height:15),
                                Row(
                                    children:<Widget>[
                                      Icon(Icons.favorite_border,color: Colors.pink,),
                                      Container(width:10),
                                      Icon(Icons.chat_bubble_outline),
                                      Container(width:10),
                                      Icon(Icons.share),

                                    ]
                                ),
                                Container(height:10),
                                Row(
                                    children:<Widget>[
                                      CircleAvatar
                                        (
                                        radius: 15,
                                        backgroundImage: AssetImage(
                                            'assets/R (1).jfif'),
                                      ),

                                      Text('  Liked by craig_love and 44,686 others',style:TextStyle(fontSize: 15,color:Colors.black)),

                                    ]
                                ),
                                Container(height:10),
                                Row(
                                    children:<Widget>[


                                      Text('Cheems feeling tired !',style:TextStyle(fontSize: 15,color:Colors.black)),

                                    ]
                                )
                              ]
                          ),
                          Container(
                            height:40,
                          ),



                          Column(
                              crossAxisAlignment: CrossAxisAlignment
                                  .start,
                              children: <Widget>[
                                Row(
                                  children:<Widget>[
                                    CircleAvatar
                                      (
                                      radius: 30,
                                      backgroundImage: AssetImage(
                                          'assets/Copa-America-2021-Champion-Argentina1.jpg'),
                                    ),

                                    Text('   LM10',style:TextStyle(fontSize: 25,color:Colors.black)),
                                  ],
                                ),
                                Container(height:15),
                                Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage
                                        (fit: BoxFit.fill,
                                          image: AssetImage(
                                              'assets/Copa-America-2021-Champion-Argentina1.jpg'))),
                                  width: 600,
                                  height:320,
                                ),
                                Container(height:15),
                                Row(
                                    children:<Widget>[
                                      Icon(Icons.favorite_border,color: Colors.pink,),
                                      Container(width:10),
                                      Icon(Icons.chat_bubble_outline),
                                      Container(width:10),
                                      Icon(Icons.share),

                                    ]
                                ),
                                Container(height:10),
                                Row(
                                    children:<Widget>[
                                      CircleAvatar
                                        (
                                        radius: 15,
                                        backgroundImage: AssetImage(
                                            'assets/R (1).jfif'),
                                      ),

                                      Text('  Liked by craig_love and 44,686 others',style:TextStyle(fontSize: 15,color:Colors.black)),

                                    ]
                                ),
                                Container(height:10),
                                Row(
                                    children:<Widget>[


                                      Text('LM10 Finally the wait is over  !',style:TextStyle(fontSize: 15,color:Colors.black)),

                                    ]
                                )
                              ]
                          ),
                          Container(
                            height:40,
                          ),


                          Column(
                              crossAxisAlignment: CrossAxisAlignment
                                  .start,
                              children: <Widget>[
                                Row(
                                  children:<Widget>[
                                    CircleAvatar
                                      (
                                      radius: 30,
                                      backgroundImage: AssetImage(
                                          'assets/1009-10091972_62-kb-png-crying-kid-pepe.png'),
                                    ),

                                    Text('   Pepe',style:TextStyle(fontSize: 25,color:Colors.black)),
                                  ],
                                ),
                                Container(height:15),
                                Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage
                                        (fit: BoxFit.fill,
                                          image: AssetImage(
                                              'assets/1009-10091972_62-kb-png-crying-kid-pepe.png'))),
                                  width: 600,
                                  height:320,
                                ),
                                Container(height:15),
                                Row(
                                    children:<Widget>[
                                      Icon(Icons.favorite_border,color: Colors.pink,),
                                      Container(width:10),
                                      Icon(Icons.chat_bubble_outline),
                                      Container(width:10),
                                      Icon(Icons.share),

                                    ]
                                ),
                                Container(height:10),
                                Row(
                                    children:<Widget>[
                                      CircleAvatar
                                        (
                                        radius: 15,
                                        backgroundImage: AssetImage(
                                            'assets/R (1).jfif'),
                                      ),

                                      Text('  Liked by craig_love and 44,686 others',style:TextStyle(fontSize: 15,color:Colors.black)),

                                    ]
                                ),
                                Container(height:10),
                                Row(
                                    children:<Widget>[


                                      Text('Pepe  Feeling sad  !',style:TextStyle(fontSize: 15,color:Colors.black)),

                                    ]
                                )
                              ]
                          ),
                          Container(
                            height:40,
                          ),




                          Column(
                              crossAxisAlignment: CrossAxisAlignment
                                  .start,
                              children: <Widget>[
                                Row(
                                  children:<Widget>[
                                    CircleAvatar
                                      (
                                      radius: 30,
                                      backgroundImage: AssetImage(
                                          'assets/th.jfif'),
                                    ),

                                    Text('   Giorgio Chielleni',style:TextStyle(fontSize: 25,color:Colors.black)),
                                  ],
                                ),
                                Container(height:15),
                                Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage
                                        (fit: BoxFit.fill,
                                          image: AssetImage(
                                              'assets/Euro-2020-italy.jpg'))),
                                  width: 600,
                                  height:320,
                                ),
                                Container(height:15),
                                Row(
                                    children:<Widget>[
                                      Icon(Icons.favorite_border,color: Colors.pink,),
                                      Container(width:10),
                                      Icon(Icons.chat_bubble_outline),
                                      Container(width:10),
                                      Icon(Icons.share),

                                    ]
                                ),
                                Container(height:10),
                                Row(
                                    children:<Widget>[
                                      CircleAvatar
                                        (
                                        radius: 15,
                                        backgroundImage: AssetImage(
                                            'assets/R (1).jfif'),
                                      ),

                                      Text('  Liked by craig_love and 44,686 others',style:TextStyle(fontSize: 15,color:Colors.black)),

                                    ]
                                ),
                                Container(height:10),
                                Row(
                                    children:<Widget>[


                                      Text('Giorgio Chiellini   Winning Moment  !',style:TextStyle(fontSize: 15,color:Colors.black)),

                                    ]
                                )
                              ]
                          ),
                          Container(
                            height:40,
                          ),


                          Column(
                              crossAxisAlignment: CrossAxisAlignment
                                  .start,
                              children: <Widget>[
                                Row(
                                  children:<Widget>[
                                    CircleAvatar
                                      (
                                      radius: 30,
                                      backgroundImage: AssetImage(
                                          'assets/Novak-Djokovic-Wimbledon-Win-2048x1365.jpg'),
                                    ),

                                    Text('   Novak Djokovic',style:TextStyle(fontSize: 25,color:Colors.black)),
                                  ],
                                ),
                                Container(height:15),
                                Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage
                                        (fit: BoxFit.fill,
                                          image: AssetImage(
                                              'assets/Novak-Djokovic-Wimbledon-Win-2048x1365.jpg'))),
                                  width: 600,
                                  height:320,
                                ),
                                Container(height:15),
                                Row(
                                    children:<Widget>[
                                      Icon(Icons.favorite_border,color: Colors.pink,),
                                      Container(width:10),
                                      Icon(Icons.chat_bubble_outline),
                                      Container(width:10),
                                      Icon(Icons.share),

                                    ]
                                ),
                                Container(height:10),
                                Row(
                                    children:<Widget>[
                                      CircleAvatar
                                        (
                                        radius: 15,
                                        backgroundImage: AssetImage(
                                            'assets/R (1).jfif'),
                                      ),

                                      Text('  Liked by craig_love and 44,686 others',style:TextStyle(fontSize: 15,color:Colors.black)),

                                    ]
                                ),
                                Container(height:10),
                                Row(
                                    children:<Widget>[


                                      Text('Novak Djokovic   20th Grand Slam ',style:TextStyle(fontSize: 15,color:Colors.black)),

                                    ]
                                )
                              ]
                          ),
                          Container(
                            height:40,
                          ),


                          Column(
                              crossAxisAlignment: CrossAxisAlignment
                                  .start,
                              children: <Widget>[
                                Row(
                                  children:<Widget>[
                                    CircleAvatar
                                      (
                                      radius: 30,
                                      backgroundImage: AssetImage(
                                          'assets/210707181306-roger-federer-full-169.jpg'),
                                    ),

                                    Text('   Roger Federer',style:TextStyle(fontSize: 25,color:Colors.black)),
                                  ],
                                ),
                                Container(height:15),
                                Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage
                                        (fit: BoxFit.fill,
                                          image: AssetImage(
                                              'assets/210707181306-roger-federer-full-169.jpg'))),
                                  width: 600,
                                  height:320,
                                ),
                                Container(height:15),
                                Row(
                                    children:<Widget>[
                                      Icon(Icons.favorite_border,color: Colors.pink,),
                                      Container(width:10),
                                      Icon(Icons.chat_bubble_outline),
                                      Container(width:10),
                                      Icon(Icons.share),

                                    ]
                                ),
                                Container(height:10),
                                Row(
                                    children:<Widget>[
                                      CircleAvatar
                                        (
                                        radius: 15,
                                        backgroundImage: AssetImage(
                                            'assets/R (1).jfif'),
                                      ),

                                      Text('  Liked by craig_love and 44,686 others',style:TextStyle(fontSize: 15,color:Colors.black)),

                                    ]
                                ),
                                Container(height:10),
                                Row(
                                    children:<Widget>[


                                      Text('Roger Federer   Hopefully will be back again !',style:TextStyle(fontSize: 15,color:Colors.black)),

                                    ]
                                )
                              ]
                          ),*/
                          Container(
                            height:40,
                          ),

                        ],

                      ),

                    );
                  },
                ),














              ),


            ],
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
      ),
    );



  }
}

