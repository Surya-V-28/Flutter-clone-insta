import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

//*
//"path": widget.path,
//"uid": widget.uid,
//"name": displayname,
//"captions": captioncontroller.text,
//"profile":profileforuser
//
//
class DataUserforPostPage {
  // ignore: non_constant_identifier_names
  late FirebaseFirestore Postpage;
  late FirebaseStorage userposts;
  initiliase() {
    Postpage = FirebaseFirestore.instance;
  }

  Future<void> createFunction(
      String newname, String caption, var postphotopath, var uidforpost) async {
    try {
      await Postpage.collection('PostImage').add({
        'name': newname,
        'caption': caption,
        "post": postphotopath,
        "uid": uidforpost,
      });
    } catch (e) {
      print(e);
    }
  }

  // to read the data in fore base
  Future<List?> read() async {
    QuerySnapshot querySnapshot;
    List docss = [];
    try {
      querySnapshot = await Postpage.collection('PostImage').get();
      if (querySnapshot.docs.isNotEmpty) {
        // ignore: unused_local_variable
        for (var doc in querySnapshot.docs.toList()) {
          // ignore: unused_local_variable
          Map a = {
            "id": doc.id,
            "name": doc['name'],
            "caption": doc['caption'],
            "post": doc['postphoto']
          };
          docss.add(a);
        }
      }
    } catch (e) {
      print(e);
    }
    return docss;
  }
}
