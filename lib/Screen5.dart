import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'Screen3.dart';
import 'Screen4.dart';
import 'Screen5.dart';

class  Screen5 extends StatelessWidget {

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
            child:Text('jacob_w' ),
         ),
         SizedBox(height:40),
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
                Text('    Jacob West'),
              ]
          ),

         Row(

             children:<Widget>
             [
               Text('    Digital Goodies Desginer'),
             ]
         ),
         Row(

             children:<Widget>
             [
               Text('    Everything is desgined'),
             ]
         ),

         SizedBox(height:20),
         FlatButton
           (

           onPressed:()
           {

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
