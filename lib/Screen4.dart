import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'DataController.dart';
import 'Screen3.dart';
import 'Screen4.dart';
import 'Screen5.dart';
class  Screen4 extends StatefulWidget {
  @override
  _Screen4State createState() => _Screen4State();
}
class _Screen4State extends State<Screen4> {
  var _auth = FirebaseAuth.instance;
  late var currentUser = _auth.currentUser;
  final TextEditingController searchController =TextEditingController();
  bool isExecuted=false;
  late QuerySnapshot snapshot;
  Widget searchData()
  {
    return ListView.builder
      (
        itemCount: snapshot.docs!.length,
        itemBuilder:(BuildContext context ,int index)
        {
          return ListTile
            (
            leading:CircleAvatar(
             // backgroundImage: NetworkImage(snapshot.data.docs[index]!['photoURl']),
            ),
            //title:Text(snapshot.data.docs[index]!['username']),
          );
        }
      );
  }

  @override
  Widget build(BuildContext context) {

    var size=MediaQuery.of(context).size;
    return MaterialApp(
      home:Scaffold(
          appBar: AppBar(
            actions:[
              GetBuilder<DataController>(
                init:DataController(),
                builder:(val) {
                  return IconButton(icon: Icon(Icons.search),
                      onPressed: () {
                        val.queryData(searchController.text).then((value) {
                          snapshot = value;
                          isExecuted = true;
                        }
                        );
                        searchData();
                      }
                  );
                }
              )
            ]
          ),
       body:SafeArea(
         child:SingleChildScrollView(
           child:Column(
              children:<Widget>
         [
               SizedBox(height:10),
              /*  Row(
                  children: <Widget>[
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      width:size.width-30,
                      height: 45,
                      child:Row(
                        children:<Widget>[
                           TextField(
                            decoration: InputDecoration(
                              hintText: 'Search for any user',
                              hintStyle: TextStyle(color:Colors.black87),
                              border: InputBorder.none,),
                              GetBuilder<DataController>(
                                  init:DataController(),
                                  builder:(val){
                                    return IconButton(icon: Icon(Icons.search),
                                      onPressed: ()
                                      {
                                        val.queryData(searchController.text).then((value)
                                        {
                                          snapshot=value;
                                          isExecuted=true;
                                        }
                                        );
                                        searchData();
                                      },
                                    );
                                  }
                              ),

                            cursorColor: Colors.black,

                          ),

                        ]
                      )

                    ),
                    SizedBox(
                      width: 15,
                    )
                  ],
                ),*/


                 SizedBox(height:15),
                 Row(
                   children:<Widget>
                   [

                        Container(
                          margin:EdgeInsets.only(left:24),
                          padding:EdgeInsets.all(10),

                          width:90,
                            height:40,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black26,
                                  style: BorderStyle.solid
                              ),
                            ),
                           child:Row(
                                  children:<Widget>[

                                  Icon(Icons.shop),
                                    Text(' Shop'),

                                          ]
                                     )


                        ),

                        Container(
                          margin:EdgeInsets.only(left:14),
                          padding:EdgeInsets.all(10),
                          width:65,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black26,
                                style: BorderStyle.solid
                            ),
                          ),
                             child:Text('style'),
                        ),

                     Container(
                       margin:EdgeInsets.only(left:14),
                       padding:EdgeInsets.all(10),
                       width:70,
                       decoration: BoxDecoration(
                         border: Border.all(
                             color: Colors.black26,
                             style: BorderStyle.solid
                         ),
                       ),
                       child:Text('sports'),
                     ),
                     Container(
                       margin:EdgeInsets.only(left:14),
                       padding:EdgeInsets.all(10),
                       width:58,
                       decoration: BoxDecoration(
                         border: Border.all(
                             color: Colors.black26,
                             style: BorderStyle.solid
                         ),
                       ),
                       child:Text(' auto'),
                     )
                   ],
                 ),
                    SizedBox(height:10),

                Container(
                    height:400,


                    child:StreamBuilder<QuerySnapshot>(
                      stream:FirebaseFirestore.instance.collection('allposts').snapshots(),
                       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot)  {
                        if(FirebaseFirestore.instance.collection('allposts').snapshots()!=null)
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
               )

         )



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

                 stream: FirebaseFirestore.instance.collection('users').where('uid',isEqualTo:currentUser!.uid ).snapshots(),
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

     ),





     );







  }
}
