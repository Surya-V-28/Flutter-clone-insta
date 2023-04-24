

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart'; 
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class VerfiyEmail extends StatefulWidget {
  VerfiyEmail({Key? key}) : super(key: key);

  @override
  _VerfiyEmailState createState() => _VerfiyEmailState();
}

class _VerfiyEmailState extends State<VerfiyEmail> {
  final auth = FirebaseAuth.instance;
  late User user;
  late Timer timer;


  @override
  void initState() {
    user = auth.currentUser!;
    user.sendEmailVerification();
   timer = Timer.periodic(Duration(seconds: 5),(timer) {

    });
    super.initState();
  }
  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(' we sent you a email you ${user.email} please verfiy it ')),
    );
  }
  Future<void> checkVerfiedEmail() async{
    timer.cancel();
    user = auth.currentUser!;

    await user.reload();
    if(user.emailVerified){
    Navigator.pushNamed(context, '/instahome');
    }

  }
}