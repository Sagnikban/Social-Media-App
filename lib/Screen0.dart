import 'package:flutter/material.dart';
class Screen0 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        body: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>
            [
              SizedBox(height :200),


              Image(
                image:AssetImage('assets/instagram_logo.png'),
                width: 340,
                height:100,

              ),
              SizedBox(height:20),

              FlatButton(
                onPressed:() {
                  Navigator.pushNamed(context, '/first');

                },
                 child: Container(
                  padding: EdgeInsets.fromLTRB(110,25,50,30),

                  color: Colors.teal,
                  width: 340,
                  height:90,
                  child:Text('Log in',
                    style:TextStyle(fontSize: 25,color:Colors.white ),
                  ),

                ),
              ),

              SizedBox(height:30),

              FlatButton(
                onPressed:()
                  {
                     Navigator.pushNamed(context,'/second');
                  },
               child: Container (
                padding: EdgeInsets.fromLTRB(110,25,50,30),

                color: Colors.teal,
                width: 340,
                height:90,
                child:Text('Sign Up',
                  style:TextStyle(fontSize: 25,color:Colors.white ),
                ),


              ),
              ),
            ],
          ),

        ),

      ),
    );
  }
}
