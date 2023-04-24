import 'package:flutter/material.dart';

class ChoseinggPage extends StatefulWidget {
  ChoseinggPage({Key? key}) : super(key: key);

  @override
  _ChoseinggPageState createState() => _ChoseinggPageState();
}

class _ChoseinggPageState extends State<ChoseinggPage> {
  get onPressed => null;

@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [Column(
          children: [
            SizedBox(height: 50.0,),
             Center(
                   child: Container(
                      width: 150.0,
                      height: 250.0,
                      child: Image(image: AssetImage('assets/instagramnamme.jpg'))),
                ),
              
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: 350.0,
              height: 45.0,
              child:
                  // ignore: deprecated_member_use
                  ElevatedButton(
                onPressed: () {
                  
                  Navigator.pushNamed(context, '/loginpage');
                },
                child: Text('sign up '),
                style: ElevatedButton.styleFrom(
                elevation: 6.0,
                backgroundColor: Colors.blue,
                textStyle: TextStyle(
                color: Colors.black,
                ),
                 padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                ),
               
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Container(
              width: 350.0,
              height: 45.0,
              child:
                  // ignore: deprecated_member_use
                  ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context,  '/signup' );
                },
                child: Text('log in '),
                style: ElevatedButton.styleFrom(
                elevation: 6.0,
                backgroundColor: Colors.blue,
                textStyle: TextStyle(
                color: Colors.black,
                ),
                padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                )
              ),
            ),
            SizedBox(height: 60.0,),
          ],
        ),
        ]
      ),
    );
  }
}
