import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Screen6 extends StatelessWidget {
  const Screen6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var size=MediaQuery.of(context).size;

     return MaterialApp(

       home:Scaffold(
          body:SafeArea(

            child:Column(
              children:<Widget>
                [
                   Container(

                     child:Text('jacob_w',textAlign: TextAlign.center),
                   ),
                   SizedBox(height:15),

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
                            Expanded(
                                    child: ListView.builder(



                                     itemCount: 10,
                                     itemBuilder: (BuildContext context, int index) {
                                       return Container(

                                           child:Column(
                                             children:<Widget>
                                               [

                                               ListTile(
                                                 title: Text(
                                                   'Mr.360',
                                                   style: TextStyle(fontWeight: FontWeight.w500),
                                                 ),
                                                 subtitle: Text('Big fan of you Sir'),
                                                 leading: CircleAvatar(

                                                   backgroundImage :AssetImage('assets/OIF.jfif'),
                                                   radius: 30,
                                                 ),
                                                 trailing: Icon(
                                                   Icons.camera_alt,

                                                   size: 35,
                                                 ),
                                               ),
                                               Divider(
                                                 height:2,
                                                 thickness:3,
                                               ),

                                               ListTile(
                                                 title: Text(
                                                   'Hitman',
                                                   style: TextStyle(fontWeight: FontWeight.w500),
                                                 ),
                                                 subtitle: Text('Very well played'),
                                                 leading: CircleAvatar(

                                                   backgroundImage :AssetImage('assets/rohit_sharma_1572353374.jpg'),

                                                   radius: 30,
                                                 ),
                                                 trailing: Icon(
                                                   Icons.camera_alt,
                                                   size: 35,
                                                 ),
                                               ),

                                               Divider(
                                                 height:2,
                                                 thickness:3,
                                               ),

                                               ListTile(
                                                 title: Text(
                                                   'Virat ',
                                                   style: TextStyle(fontWeight: FontWeight.w500),
                                                 ),
                                                 subtitle: Text('Great work'),
                                                 leading: CircleAvatar(

                                                   backgroundImage :AssetImage('assets/f59e0e9e-ad66-43c8-ab41-236e0227f0ab.jpg'),

                                                   radius: 30,
                                                 ),
                                                 trailing: Icon(
                                                   Icons.camera_alt,
                                                   size: 35,
                                                 ),
                                               ),



                                               Divider(
                                                 height:2,
                                                 thickness:3,
                                               ),

                                               ListTile(
                                                 title: Text(
                                                   'CR7 ',
                                                   style: TextStyle(fontWeight: FontWeight.w500),
                                                 ),
                                                 subtitle: Text('Congrats'),
                                                 leading: CircleAvatar(

                                                   backgroundImage :AssetImage('assets/Cristiano-Ronaldo-Wins-Euro-2020-Golden-Boot1.jpg'),

                                                   radius: 30,
                                                 ),
                                                 trailing: Icon(
                                                   Icons.camera_alt,
                                                   size: 35,
                                                 ),
                                               ),



                                               Divider(
                                                 height:2,
                                                 thickness:3,
                                               ),



                                               ListTile(
                                                 title: Text(
                                                   'Cheems ',
                                                   style: TextStyle(fontWeight: FontWeight.w500),
                                                 ),
                                                 subtitle: Text('How are you?'),
                                                 leading: CircleAvatar(

                                                   backgroundImage :AssetImage('assets/bg,f8f8f8-flat,750x,075,f-pad,750x1000,f8f8f8.jpg'),

                                                   radius: 30,
                                                 ),
                                                 trailing: Icon(
                                                   Icons.camera_alt,
                                                   size: 35,
                                                 ),
                                               ),


                                               Divider(
                                                 height:2,
                                                 thickness:3,
                                               ),

                                               ListTile(
                                                 title: Text(
                                                   'LM10 ',
                                                   style: TextStyle(fontWeight: FontWeight.w500),
                                                 ),
                                                 subtitle: Text('You truly deserved'),
                                                 leading: CircleAvatar(

                                                   backgroundImage :AssetImage('assets/Copa-America-2021-Champion-Argentina1.jpg'),

                                                   radius: 30,
                                                 ),
                                                 trailing: Icon(
                                                   Icons.camera_alt,
                                                   size: 35,
                                                 ),
                                               ),







                                               Divider(
                                                 height:2,
                                                 thickness:3,
                                               ),
                                               ListTile(
                                                 title: Text(
                                                   'Pepe ',
                                                   style: TextStyle(fontWeight: FontWeight.w500),
                                                 ),
                                                 subtitle: Text('Dont cry'),
                                                 leading: CircleAvatar(

                                                   backgroundImage :AssetImage('assets/1009-10091972_62-kb-png-crying-kid-pepe.png'),

                                                   radius: 30,
                                                 ),
                                                 trailing: Icon(
                                                   Icons.camera_alt,
                                                   size: 35,
                                                 ),
                                               ),




                                               Divider(
                                                 height:2,
                                                 thickness:3,
                                               ),
                                               ListTile(
                                                 title: Text(
                                                   'Giorgio Chiellini',
                                                   style: TextStyle(fontWeight: FontWeight.w500),
                                                 ),
                                                 subtitle: Text('Performed very well'),
                                                 leading: CircleAvatar(

                                                   backgroundImage :AssetImage('assets/th.jfif'),

                                                   radius: 30,
                                                 ),
                                                 trailing: Icon(
                                                   Icons.camera_alt,
                                                   size: 35,
                                                 ),
                                               ),




                                               Divider(
                                                 height:2,
                                                 thickness:3,
                                               ),

                                               ListTile(
                                                 title: Text(
                                                   'Novak Djokovic',
                                                   style: TextStyle(fontWeight: FontWeight.w500),
                                                 ),
                                                 subtitle: Text('The most consistent'),
                                                 leading: CircleAvatar(

                                                   backgroundImage :AssetImage('assets/Novak-Djokovic-Wimbledon-Win-2048x1365.jpg'),

                                                   radius: 30,
                                                 ),
                                                 trailing: Icon(
                                                   Icons.camera_alt,
                                                   size: 35,
                                                 ),
                                               ),


                                               Divider(
                                                 height:2,
                                                 thickness:3,
                                               ),

                                               ListTile(
                                                 title: Text(
                                                   'Roger Federer',
                                                   style: TextStyle(fontWeight: FontWeight.w500),
                                                 ),
                                                 subtitle: Text('very sad seeing you lose'),
                                                 leading: CircleAvatar(

                                                   backgroundImage :AssetImage('assets/210707181306-roger-federer-full-169.jpg'),

                                                   radius: 30,
                                                 ),
                                                 trailing: Icon(
                                                   Icons.camera_alt,
                                                   size: 35,
                                                 ),
                                               ),



                                               Divider(
                                                 height:2,
                                                 thickness:3,
                                               ),
                                               ListTile(
                                                 title: Text(
                                                   'Tommy',
                                                   style: TextStyle(fontWeight: FontWeight.w500),
                                                 ),
                                                 subtitle: Text('Where do you live?'),

                                                 leading: CircleAvatar(

                                                   backgroundImage :AssetImage('assets/R (3).jfif'),

                                                   radius: 30,
                                                 ),
                                                 trailing: Icon(
                                                   Icons.camera_alt,
                                                   size: 35,
                                                 ),
                                               ),




                                               Divider(
                                                 height:2,
                                                 thickness:3,
                                               ),


































                                             ]
                                           )







                                       );
                                     }
                                     )
                            )
              ]
            )

          ),

           bottomNavigationBar: Row(
       children:<Widget>[




    Container(
    margin:EdgeInsets.only(left:144),
    child:IconButton(
    onPressed:()
    {

    },
    icon: Icon(Icons.camera_alt),
    )
    ),


    ],
    ),

    )
     );


  }
}

