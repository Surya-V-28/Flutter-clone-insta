import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  // ignore: unused_field
  String? _emaillogin, _passwordlogin;
  // ignore: unused_field
  var _formkey = GlobalKey<FormState>();
  final authlogin = FirebaseAuth.instance;
  bool ishiddenpassword = true;
  IconData eyesee = Icons.visibility_off;
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
              child: Form(
                key: _formkey,
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
                      child: TextFormField(
                        validator: (val) {
                          return RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(val!)
                              ? null
                              : "Enter correct email";
                        },
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'email',
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            hintText: '@gmail.com'),
                        onChanged: (value1) {
                          _emaillogin = value1;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: 375.0,
                      color: Colors.white10,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        obscureText: ishiddenpassword,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  ishiddenpassword == true
                                      ? ishiddenpassword = false
                                      : ishiddenpassword = true;
                                  ishiddenpassword == true
                                      ? eyesee = Icons.visibility_off
                                      : eyesee = Icons.visibility;
                                });
                              },
                              icon: Icon(eyesee),
                            ),
                            border: OutlineInputBorder(),
                            labelText: 'password',
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            hintText: 'password'),
                        onChanged: (value1) {
                          setState(() {
                            _passwordlogin = value1;
                          });
                          
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(left: 265.0),
                            // ignore: deprecated_member_use
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/resetpass');
                              },
                              child: Text(
                                'repassword',
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 10),
                              ),
                            ))
                      ],
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
                          print(emailController.text);
                          print(_passwordlogin);
                          authlogin
                              .signInWithEmailAndPassword(
                                  email: 'missallison23@gmail.com',
                                  password: "")
                              .then((_) {
                            Navigator.pushNamed(context, '/instahome');
                          }).catchError((e){
                            debugPrint('error');
                            debugPrint(e.toString());
                          });
                        },
                        child: Text('log in '),
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
                      height: 30.0,
                    ),
                    Center(
                      child: Text(
                        'or',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Divider(
                      color: Colors.white,
                      indent: 10.0,
                      endIndent: 232.0,
                      height: 00.0,
                      thickness: 1.0,
                    ),
                    Divider(
                      color: Colors.white,
                      indent: 232.0,
                      endIndent: 10.0,
                      height: 00.0,
                      thickness: 1.0,
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 90.0,
                        ),
                        Text(
                          'dont have an account?',
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/loginpage');
                            },
                            child: Text(
                              'new account',
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ))
                      ],
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
            ),
          ])),
    );
  }
}
