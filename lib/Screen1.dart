import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'Screen2.dart';
import 'Screen3.dart';
class Screen1 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:SafeArea(
          child: Column(

            children: <Widget>
            [
                  SizedBox(height:80),
                  Image(
                  image: AssetImage('assets/instagram_logo.png'),
                  width: 340,
                  height: 60,
                  ),
              SizedBox(height:20),
                    Container(

                      padding: EdgeInsets.fromLTRB(20,17,50,10),
                        color: Color(0xffe8e8e8),

                        child:Text('Username',style:TextStyle(fontSize:25,color:Colors.black38 )),
                        width:350,
                        height:70,

                        ),


              SizedBox(height:20),
              Container(

                padding: EdgeInsets.fromLTRB(20,17,50,10),

                color: Color(0xffe8e8e8),
                child:Text('Password',style:TextStyle(fontSize:25,color:Colors.black38)),
                width:350,
                height:70,

              ),
              SizedBox(height:20),

              Container(

                margin:EdgeInsets.only(left:180),
                child:Text('Forgot Password ?',style:TextStyle(fontSize:25,color:Colors.blueAccent),
                textAlign: TextAlign.end),

              ),
              SizedBox(height:20),
              FlatButton
                (

                  onPressed:()
                  {
                    Navigator.pushNamed(context,'/three');
                  },

                  child:  Container(

                  padding: EdgeInsets.fromLTRB(130,17,50,10),

                   color: Colors.blue,
                   child:Text('Log in',style:TextStyle(fontSize:25,color:Colors.white)),
                   width:350,
                   height:70,

                  ),

              ),


              SizedBox(height:15),
              Row(
                  children: <Widget>[
                    Expanded(
                        child: Divider()
                    ),

                    Text("OR"),

                    Expanded(
                        child: Divider()
                    ),
                  ]
              ),
              SizedBox(height:20),

              Container(
                margin: EdgeInsets.only(left:60),
               child: Row(
                   children: <Widget>[
                      RichText(
                        text:TextSpan(
                          children:[
                            TextSpan(
                              text:'Dont have an account ?',style:TextStyle(fontSize:20,color: Colors.black45),

                            ),

                                TextSpan(
                                    recognizer: new TapGestureRecognizer()
                                    ..onTap = ( ){Navigator.pushNamed(context, '/second');},
                                text: ' Sign Up', style: TextStyle(fontSize:20,color: Colors.blue),

                            ),

                          ],
                        ),
                      )
                    ]
                ),
              ),

              SizedBox(height:90),
           Divider(
             height:2,
             thickness:3,
           ),
              SizedBox(height:30),
              Container(
                child:Text('Instagram OT Facebook',style:TextStyle(fontSize:20,color:Colors.black26),
                    textAlign: TextAlign.end),

              )
  ]
    )
    )
      )
    );
  }
}