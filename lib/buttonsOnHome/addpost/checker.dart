// ignore: unused_import
import 'dart:io';

// ignore: unused_import
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:firebase_storage/firebase_storage.dart';
// ignore: duplicate_import
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class Checkerforthepostedimages extends StatefulWidget {
  Checkerforthepostedimages({Key? key}) : super(key: key);

  @override
  _CheckerforthepostedimagesState createState() =>
      _CheckerforthepostedimagesState();
}

class _CheckerforthepostedimagesState extends State<Checkerforthepostedimages> {
  var imagepicker = ImagePicker();
  File? photoofimage;
  var ref;
  List imagelinks = [];
  var imageurls;
  @override
  void initState() {
    super.initState();
    functionoffirebase();
  }

  void functionoffirebase() async {
    imageurls = FirebaseFirestore.instance.collection('imageurls');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('upload'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/twochecker');
              },
              icon: Icon(Icons.upload))
        ],
      ),
      body: Column(
        children: [
          // ignore: deprecated_member_use
          ElevatedButton(
            onPressed: () async {
              var pathofimage = await takeimage();
              var downloadurl = await uoploadimage(pathofimage);
              await  imageurls.add({'url':downloadurl});
              debugPrint(' this is path for image $pathofimage');
              debugPrint(' this is download link for image $downloadurl');
            },
            child: Container(
              color: Colors.red,
              width: 100,
              height: 130,
              child: Icon(
                Icons.add,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future takeimage() async {
    // ignore: unused_local_variable
    var choosenone = await imagepicker.pickImage(source: ImageSource.gallery);
    if (choosenone == null) {
      return;
    }
    setState(() {
      photoofimage = File(choosenone.path);
    });

    return choosenone.path;
  }

  Future uoploadimage(var path) async {
    var pathforimage;
    String filaname = basename(path);
    ref = FirebaseStorage.instance.ref().child(filaname);
    await ref.putFile(photoofimage).whenComplete(() async {
      await ref.getDownloadURL().then((value)  {
        pathforimage = value;

      });
    });
    return pathforimage;
  }
}
