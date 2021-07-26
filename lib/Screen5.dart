import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Screen3.dart';
import 'Screen4.dart';
import 'Screen5.dart';
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
   getdetails () async {
    late var currentUser = _auth.currentUser;

    if (currentUser != null) {
      var uid = await currentUser!.uid;
      await FirebaseFirestore.instance
          .collection('users')
          .where('uid', isEqualTo: uid)
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
        setState(() {
          username = doc['username'];
          bio=doc['bio'];

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
    body:SafeArea(

       child:Column(
       children:<Widget>[

         SizedBox(height:40),
         Container(
           padding:EdgeInsets.only(left:50),
            child:Text("      ${username}" ),
         ),
         SizedBox(height:40)  ,
         Row(
             children:<Widget>
             [
               Container(width:20),
               CircleAvatar(
                   radius:50,

                   backgroundImage:AssetImage('assets/OIP.jfif'),

               ),
               Container(width:45),
               Container(
                 width:40,
                 child:Text('   54 posts'),
               ),
               Container(width:20),
               Container(
                 width:68,
                 child:Text('    834  followers'),
               ),
               Container(width:10),
               Container(
                 width:68,
                 child:Text('    162  following'),
               )

             ]


         ),
              Container(height:20),

          Row(

            children:<Widget>
            [
               Text("      ${username}"),
           ]
          ),

         Row(

             children:<Widget>
             [
               Text('       ${bio}'),
             ]
         ),


         SizedBox(height:50),
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
         SizedBox(
           height:287,
           child:StaggeredGridView.countBuilder(
             crossAxisCount: 4,
             itemCount: 15,
             itemBuilder: (BuildContext context, int index) => new Container(
               height: 120.0,
               width: 120.0,
               decoration: BoxDecoration(
                 image: DecorationImage(
                   image: NetworkImage('https://picsum.photos/500/500?random=$index'),
                   fit: BoxFit.fill,
                 ),
                 shape: BoxShape.rectangle,
               ),
             ),
             staggeredTileBuilder: (int index) =>
             new StaggeredTile.count(2, index.isEven ? 3 : 2),
             mainAxisSpacing: 4.0,
             crossAxisSpacing: 4.0,
           ),


         ),


       ]



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

              child :CircleAvatar(
                radius:15,

                backgroundImage:AssetImage('assets/OIP.jfif'),


              ),
            ),


          )

        ],
      ),

    )

    );
  }



}
