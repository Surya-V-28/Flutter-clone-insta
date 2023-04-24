import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagrambasics/buttonsOnHome/profile/backend/profilestorage.dart';
// ignore: unused_import
import 'package:instagrambasics/buttonsOnHome/profile/profilepage.dart';
// ignore: unused_import
import 'package:instagrambasics/nodyofinstapage/instabody.dart';

var displayname;

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  // ignore: unused_field
  String? _email, _password;
  final auth = FirebaseAuth.instance;
  late String uid;
  var displayname = '', bioforuseruid = '', moreinfo = '';
  var usernamebiomore = [];
  late DataBaseForUserProfileName dataBaseForUserProfileName;
  initialiase() {
    dataBaseForUserProfileName = DataBaseForUserProfileName();
    dataBaseForUserProfileName.initiliaseforusernamebioMore();
  }

  // ignore: unused_field
  var _formkey = GlobalKey<FormState>();
  String nameforusercreating = '';

  validatea  () {
    if (_formkey.currentState!.validate()){
          
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
      body: ListView(children: [
        Column(children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: 100.0,
                    height: 140.0,
                    child:
                        Image(image: AssetImage('assets/instagramnamme.jpg'))),
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 10),
                        child: Container(
                          width: 375,
                          color: Colors.white10,
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: usernameController,
                            validator: (val) {
                              if (val!.isEmpty ||
                                  val == '' ||
                                  val.length > 3 ||
                                  val.length < 60) {
                                return 'enter the name';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              fillColor: Colors.blue,
                              border: OutlineInputBorder(),
                              labelText: 'username',
                              labelStyle: TextStyle(
                                color: Colors.white,
                              ),
                              hintText: 'username',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 10),
                        child: Container(
                          width: 375,
                          color: Colors.white10,
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            decoration: InputDecoration(
                                fillColor: Colors.blue,
                                border: OutlineInputBorder(),
                                labelStyle: TextStyle(color: Colors.white),
                                labelText: 'email',
                                hintText: '@gmail.com'),
                            validator: (val) {
                              return RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(val!)
                                  ? null
                                  : "Enter correct email";
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 10),
                        child: Container(
                          width: 375,
                          color: Colors.white10,
                          child: TextField(
                            decoration: InputDecoration(
                                fillColor: Colors.red,
                                border: OutlineInputBorder(),
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                labelText: 'password',
                                hintText: 'password'),
                            
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 10),
                        child: Container(
                          width: 375,
                          color: Colors.white10,
                          child: TextFormField(
                            validator: (vae) {
                              return  vae!.length >=6 ? null: 'password contains at least 6 characters';
                            },
                            controller: passwordcontroller,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                labelText: 'confirm password',
                                hintText: '@gmail.com'),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        width: 350.0,
                        height: 45.0,
                        child:
                            // ignore: deprecated_member_use
                            ElevatedButton(
                                child: Text('sign up '),
                                style: ElevatedButton.styleFrom(
                                elevation: 6.0,
                                backgroundColor: Colors.blue,
                                textStyle: TextStyle(
                                color: Colors.black,
                                ),
                                
                                padding:
                                    EdgeInsets.only(bottom: 10.0, top: 10.0),
                                ),
                                onPressed: () async{
                                     await validatea();
                                      auth
                                      .createUserWithEmailAndPassword(
                                          email: emailController.text.trim(),
                                          password:passwordcontroller.text.trim())
                                      .then((_) {
                                    Navigator.pushNamed(
                                        context, '/setusername');
                                    uid = auth.currentUser!.uid;
                                  });
                                }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ]),
    );
  }
}
