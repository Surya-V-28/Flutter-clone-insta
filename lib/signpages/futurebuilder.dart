import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// ignore: unused_import
import 'package:instagrambasics/buttonsOnHome/addpost/checker.dart';
// ignore: unused_import
import 'package:instagrambasics/buttonsOnHome/profile/profilepage.dart';

// ignore: unused_import
import 'package:instagrambasics/buttonsOnHome/search/secondtime.dart';
// ignore: unused_import
import 'package:instagrambasics/signpages/pagetochose.dart';
// ignore: unused_import
import 'package:instagrambasics/signpages/singin.dart';
// ignore: unused_import
import 'package:instagrambasics/userdata/userprofile.dart';

// ignore: unused_import
import 'loginpage.dart';

class FutureWidgets extends StatefulWidget {
  FutureWidgets({Key? key}) : super(key: key);

  @override
  _FutureWidgetsState createState() => _FutureWidgetsState();
}

class _FutureWidgetsState extends State<FutureWidgets> {
  final Future<FirebaseApp> _myapp = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _myapp,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          print('you have an error ${snapshot.error.toString()}');
          return Text('you  have some problem');
        } else if (snapshot.hasData) {
          debugPrint('loaded succcesfull the firebase');
          return SignInPage();
        } else {
          return SpinKitFadingCircle(
            itemBuilder: (BuildContext context, int index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: index.isEven ? Colors.red : Colors.green,
                ),
              );
            },
          );
        }
      },
    );
  }
}
