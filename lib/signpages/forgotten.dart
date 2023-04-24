


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class ResetScreen extends StatefulWidget {
  ResetScreen({Key? key}) : super(key: key);
  
  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  // ignore: unused_field
  String? _emaillogin;
    final authlogin = FirebaseAuth.instance;
 
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text(
              '',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            shadowColor: Colors.black,
            elevation: 2.0,
          ),
          backgroundColor: Colors.black,
          body: ListView(children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                        width: 150.0,
                        height: 250.0,
                        child: Image(
                            image: AssetImage('assets/instagramnamme.jpg'))),
                  ),
                  Container(
                    width: 375.0,
                    color: Colors.white10,
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'email',
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                          hintText: '@gmail.com'),
                          onChanged: (value1){
                            _emaillogin=value1;
                          },
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  
                 // ignore: deprecated_member_use
                 ElevatedButton(
                  onPressed: (){
                       // ignore: unnecessary_brace_in_string_interps
                       authlogin.sendPasswordResetEmail(email: '$_emaillogin');
                 },
                 child: Text('submit'),
                 style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                 ),
                 )
                 
                 ,
                  SizedBox(
                    height: 20.0,
                  ),
                 SizedBox(
                    height: 40.0,
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  Center(
                      child: Text(
                    'Instagram From Facebook',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ))
                ],
              ),
            ),
          ])),
    );
  }
}
