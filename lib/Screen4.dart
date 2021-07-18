import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'Screen3.dart';
import 'Screen4.dart';
import 'Screen5.dart';

class  Screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return MaterialApp(


        home:Scaffold(
       body:SafeArea(
         child:SingleChildScrollView(
           child:Column(
              children:<Widget>
         [
               SizedBox(height:10),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      width:size.width-30,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade300),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search,
                              // color:  Colors.grey,
                            )),
                        cursorColor: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    )
                  ],
                ),


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
               SizedBox(
                   height:485,
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

     ),





     );







  }
}
