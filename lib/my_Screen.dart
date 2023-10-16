

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyScreen extends StatelessWidget
{
  const MyScreen ({super.key});
  @override
  Widget build(BuildContext context) {

    return Scaffold(


      backgroundColor: Colors.purple[400],
      appBar: AppBar(
        title: Text('Abeedor App'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {  },
        ),

      ),
    body:

    Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      Image.network("https://th.bing.com/th/id/OIP.21NfOTzbhMny-Vrx5PEm4AHaE7?pid=ImgDet&rs=1", width: 300,),
      Image.asset("images/IMG_2964.heic", width: 300, height: 200, fit: BoxFit.scaleDown,),
      RichText(


          text: TextSpan(
        text: "Please  ",
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,  fontStyle: FontStyle.italic),
        children: [

          TextSpan(

            text: "click here ",
            style: TextStyle(
              color: Colors.amber
            )
          ),
          TextSpan(

            text:  "Sign Up",
            style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20
            )
          )
        ]
      ))
    ],
    )






    );

  }

}