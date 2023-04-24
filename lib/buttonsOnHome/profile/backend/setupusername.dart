// ignore: duplicate_ignore
// ignore: unused_import, unnecessary_import
// ignore_for_file: unnecessary_import, duplicate_ignore

import 'dart:async';
import 'dart:core';
import 'dart:io';
// ignore: unnecessary_import
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: unused_import
import 'package:firebase_storage/firebase_storage.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// ignore: unused_import
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagrambasics/constants/post_json.dart';
// ignore: unused_import
import 'package:permission_handler/permission_handler.dart';
// ignore: unused_import
import 'package:path/path.dart';

var profileforuser;

class ChnageUserName extends StatefulWidget {
  ChnageUserName({Key? key}) : super(key: key);
  @override
  _ChnageUserNameState createState() => _ChnageUserNameState();
}

class _ChnageUserNameState extends State<ChnageUserName> {
  TextEditingController? nameforuser = TextEditingController();
  TextEditingController? usernameforuser = TextEditingController();
  TextEditingController? websiteforuser = TextEditingController();
  TextEditingController? bioforuser = TextEditingController();
  File? _image;
  Map<String, dynamic> fristvalues = {};
  bool checkerforupload = true;
  final picker = ImagePicker();
  var currentuser = FirebaseAuth.instance.currentUser!.uid;
  @override
  void initState() {
    super.initState();
    // onsearchforuser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Set the Username',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () async {}, icon: Icon(Icons.send)),
        ],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          SizedBox(
            height: 30,
          ),
          CircleAvatar(
            backgroundColor: Colors.blue,
            child: ClipOval(
              child: SizedBox(
                height: 100,
                width: 100,
                // ignore: unnecessary_null_comparison
                child: (_image != null)
                    ? Image.file(_image!, fit: BoxFit.fill)
                    : Image.asset(circularimage[4]),
              ),
            ),
            radius: 49.5,
          ),
          SizedBox(
            height: 20,
          ),
          // ignore: deprecated_member_use
          ElevatedButton(
              onPressed: () async {
                await chooseimage();
                await uploadimage();
              },
              child: Text(
                'Upload image is important ',
                style: TextStyle(color: Colors.white),
              )),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 270,
            color: Colors.white60,
            child: TextField(
              controller: nameforuser,
              decoration: InputDecoration(
                fillColor: Colors.white,
                focusColor: Colors.red,
                labelText: ' Name',
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            color: Colors.white60,
            child: TextField(
              controller: usernameforuser,
              cursorColor: Colors.red,
              decoration: InputDecoration(
                labelText: '   username',
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            color: Colors.white54,
            child: TextField(
              controller: websiteforuser,
              decoration: InputDecoration(
                labelText: '   website',
                labelStyle: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          // ignore: deprecated_member_use
          ElevatedButton(
            onPressed: () async {
              await uploadimage();

              // ignore: await_only_futures
              var uid = await FirebaseAuth.instance.currentUser!.uid;
              // ignore: unnecessary_null_comparison
              List listforuser = FunctionforUserName(nameforuser!.text);
              await addtheNewUser(nameforuser!.text, uid, profileforuser,
                  websiteforuser!.text, bioforuser!.text, listforuser);

              // ignore: unused_local_variable

              Navigator.pushNamed(context, '/instahome');
            },
            child: Text(
              'save profile',
              style: TextStyle(color: Colors.blue),
            ),
          )
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  FunctionforUserName(String name) {
    var n = name.length;
    // ignore: non_constant_identifier_names
    List Usersearch = [];
    for (var i = 0; i < n; i++) {
      Usersearch.add(name[i]);
      print(name[i]);
    }
    return Usersearch;
  }

  Future chooseimage() async {
    // ignore: deprecated_member_use
    final pickedfile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedfile == null) {
      return;
    }
    setState(() {
      _image = File(pickedfile.path);

      // profileforuser = pickedfile.path;
    });
  }

  Future uploadimage() async {
    var imagelinks;
    String filaname = basename(_image!.path);
    var firebasestorage = FirebaseStorage.instance.ref().child(filaname);
    // ignore: unused_local_variable
    await firebasestorage.putFile(_image!).whenComplete(() async {
      await firebasestorage.getDownloadURL().then((value) async {
        // ignore: unused_local_variable
        imagelinks = value;
      });
      setState(() {
        profileforuser = imagelinks;
      });
      return imagelinks;
    });
  }

  var userforprofile = FirebaseFirestore.instance.collection('bioUser');

//two function only possible like read and write...
  Future updateForUserBio(
      String id, String namechange, String bioforuser, String mooreinfo) async {
    try {
      await userforprofile.doc(id).update(
          {"name": namechange, "bio": bioforuser, "more": mooreinfo}).then((_) {
        debugPrint('sucess fully added');
      });
    } catch (e) {
      print(e);
    }
  }

  Future updatetheuserprofile(String name, String uid, String profilepic,
      String more, String about,List listforuser) async {
    await userforprofile.doc(uid).update({
      "name": name,
      "uid": uid,
      "profileimag": profilepic,
      "more": more,
      "about": about,
      "searchkeys": listforuser
    });
  }

// function for adding the username in data
  Future addtheNewUser(String name, String uid, String profilepic, String more,
      String about, List listforuser) async {
    await userforprofile.doc(uid).set({
      "name": name,
      "uid": uid,
      "profileimag": profilepic,
      "more": more,
      "about": about,
      "searchkeys": listforuser
    });
  }
}
