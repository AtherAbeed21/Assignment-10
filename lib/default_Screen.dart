import 'package:flutter/material.dart';

class defaultScreen extends StatelessWidget
{
  const defaultScreen ({super.key});


  @override
  Widget build(BuildContext Context)
  {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.deepOrange, // Moved color here from AppBar
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
            boxShadow: [
              BoxShadow(color: Colors.deepOrange, offset: Offset(0, 2), blurRadius: 100),
            ],
          ),
          child: AppBar(
            title: Text(
              'Default',
              style: TextStyle(color: Colors.yellowAccent, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent, // Making AppBar background transparent
            leading: IconButton(icon: Icon(Icons.home), onPressed: () {}),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
              IconButton(onPressed: () {}, icon: Icon(Icons.person_rounded)),
            ],
            elevation: 0, // Set to 0, since we use boxShadow of Container
            shape: RoundedRectangleBorder(

              borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
            ),
          ),
        ),
      ),
    );

  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style: TextStyle(fontWeight: FontWeight.bold),),
      ),

      body:
      Column(
        children: [
          ElevatedButton(onPressed: () {
            print('Email has been sent');
            },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 10,
                padding: EdgeInsets.all(10),

              ),
              child: Text('Send Email'))
        ],
      ),


    );
  }
}
