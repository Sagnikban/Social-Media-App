import 'package:flutter/material.dart';
import 'Screen3.dart';
import 'Screen4.dart';
import 'Screen5.dart';

class Screen3 extends StatefulWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  @override
  Widget build(BuildContext context) {
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
                          ),
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

