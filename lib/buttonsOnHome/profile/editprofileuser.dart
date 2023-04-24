// ignore: unused_import
import 'dart:core';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
// ignore: unused_import
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagrambasics/constants/post_json.dart';
// ignore: unused_import
import 'package:permission_handler/permission_handler.dart';
// ignore: unused_import
import 'package:path/path.dart';
var profileforuser;

class EditProfileForUser extends StatefulWidget {
  EditProfileForUser({Key? key}) : super(key: key);
 @override
  _EditProfileForUserState createState() => _EditProfileForUserState();
}

class _EditProfileForUserState extends State<EditProfileForUser> {
  TextEditingController? nameforuser = TextEditingController();
  TextEditingController? usernameforuser = TextEditingController();
  TextEditingController? websiteforuser = TextEditingController();
  TextEditingController? bioforuser = TextEditingController();
  File? _image;
  Map<String, dynamic> fristvalues = {};
  bool checkerforupload = true;
  final picker = ImagePicker();
  var currentuser = FirebaseAuth.instance.currentUser!.uid;
// ignore: avoid_init_to_null
   var  pathforgeturl = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.cancel_outlined),
        ),
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
                child: (pathforgeturl != null)
                    ? Image.network('$pathforgeturl')
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
                  // ignore: unused_local_variable
                   pathforgeturl = await uploadimage();
                },
              child: Text(
                'Upload image ',
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
              controller: bioforuser,
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
          checkerforupload == true
             
              ? Container(
                color: Colors.green,
                child: 
                 // ignore: deprecated_member_use
                ElevatedButton(
                    onPressed: () async {
                     
                      // ignore: await_only_futures
                      var uid = await FirebaseAuth.instance.currentUser!.uid;
                      // ignore: unnecessary_null_comparison
                      await updatetheuserprofile(
                              nameforuser!.text,
                              uid,
                              pathforgeturl,
                              websiteforuser!.text,
                              bioforuser!.text);

                      Navigator.pushNamed(context, '/profilepage');
                      setState(() {
                        checkerforupload = false;
                      });
                    },
                    child: Text(
                      'Update Profile',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
              )
              : Text(
                  ' already saved',
                  style: TextStyle(color: Colors.blue),
                )
        ],
      ),
    );
  }

  Future chooseimage() async {
    // ignore: deprecated_member_use
    final pickedfile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedfile == null) {
      return;
    }
    setState(() {
      _image = File(pickedfile.path);

      
    });
  }

  Future uploadimage() async {
    String filaname = basename(_image!.path);
    // ignore: await_only_futures
    var firebasestorage = await FirebaseStorage.instance.ref().child(filaname);
    // ignore: unused_local_variable
    var imageurllikfordownload = await FirebaseStorage.instance.ref().child(filaname).getDownloadURL();
    debugPrint('$imageurllikfordownload');
    // ignore: unused_local_variable
    var uploadtask = await firebasestorage.putFile(_image!);
    
    return imageurllikfordownload ;
  }
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
    String more, String about) async {
  await userforprofile.doc(uid).update({
    "name": name,
    "uid": uid,
    "profileimag": profilepic,
    "more": more,
    "about": about
  });
}

// function for adding the username in data
Future addtheNewUser(String name, String uid, String profilepic, String more,
    String about) async {
  await userforprofile.doc(uid).set({
    "name": name,
    "uid": uid,
    "profileimag": profilepic,
    "more": more,
    "about": about
  });
   
}
