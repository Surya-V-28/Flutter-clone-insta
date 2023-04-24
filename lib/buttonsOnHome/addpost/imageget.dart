import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// ignore: unused_import
import 'package:instagrambasics/buttonsOnHome/addpost/databasehelp.dart';
import 'package:instagrambasics/buttonsOnHome/addpost/post.dart';
// ignore: unused_import
import 'package:instagrambasics/nodyofinstapage/instabody.dart';
import 'package:path/path.dart';

// ignore: must_be_immutable
class ImageGetter extends StatefulWidget {
  ImageGetter({
    Key? key,
  }) : super(key: key);

  @override
  _ImageGetterState createState() => _ImageGetterState();
}

class _ImageGetterState extends State<ImageGetter> {
  File? imageforpost;
  final picker = ImagePicker();
 
  var instance1;
  String? uid1 = FirebaseAuth.instance.currentUser!.uid;
  void initState() {
    super.initState();
    addlinktodata();
  }

  Future addlinktodata() async {
    // ignore: unused_local_variable

    // ignore: unused_local_variable
    var instance1 = FirebaseFirestore.instance.collection('posts');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.next_plan_rounded,
                color: Colors.white,
              ))
        ],
      ),
      // ignore: deprecated_member_use
      body: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        
      
        child: Text('choose image'),
        onPressed: () async {
          debugPrint(
              'hellllllllllll ooooooooooo           ooooooooooooooooooooooooooooooooooo');
          await chooseimageforpost();
          debugPrint(' images started uploading');
          // ignore: unused_local_variable
          var downloadpath = await uploadtheimagepost();
          debugPrint('this is the path for the studff ' + downloadpath);
          debugPrint('this is the path for the studff ' +downloadpath );
          debugPrint(' images ended uploading');
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PostPageforCreating(
                        image: imageforpost,
                        uid: uid1,
                        path: downloadpath,
                      )));
        },
      ),
    );
  }

  Future chooseimageforpost() async {
    // ignore: non_constant_identifier_names
    final XFile? Pickedfileforpost =
        await picker.pickImage(source: ImageSource.gallery);
    if (Pickedfileforpost == null) {
      return;
    }
    setState(() {
      imageforpost = File(Pickedfileforpost.path);
    });
    // ignore: unused_local_variable
    var path = Pickedfileforpost.path;
  }

  Future uploadtheimagepost() async {
    var downloadurl;
    var filenameofpost = basename(imageforpost!.path);
    print('this the path in the uploadimagepost $filenameofpost');
    // ignore: await_only_futures
    var ref = FirebaseStorage.instance.ref().child(filenameofpost);
    await ref.putFile(imageforpost!).whenComplete(() async {
      await ref.getDownloadURL().then((value) async {
        // ignore: unused_local_variable

        downloadurl = value;
      });
      debugPrint('this  is irl in uppoad images ' + downloadurl);
      return downloadurl;
    });
    return downloadurl;
  }
}
