import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';


class DataUser {
  late FirebaseFirestore userStore;
   late FirebaseStorage userposts ;
  initiliase() {
    userStore = FirebaseFirestore.instance;
  }

  Future<void> createFunction(String newname,String newbio,String newmore) async {
    try {
      await userStore.collection('ProfileFull').add({'name': newname, 'bio':newbio,'more':newmore});
    } catch (e) {
      print(e);
    }
  }

  // to read the data in fore base
  Future<List?> read() async {
    QuerySnapshot querySnapshot;
    List docss = []; 
    try {
      querySnapshot = await userStore.collection('ProfileFull').get();
      if (querySnapshot.docs.isNotEmpty) {
        // ignore: unused_local_variable
        for (var doc in querySnapshot.docs.toList()) {
          // ignore: unused_local_variable
          Map a = {
            "id": doc.id,
            "name": doc['name'],
            "bio": doc['bio'],
            "more": doc['more']
          };
          docss.add(a);          
        }
      }
    } catch (e) {
      print(e);
    }
    return docss;
  }

  //code for the updata the user data
  Future<void> updataUser(String id, String nameIn, String bioIN) async {
    try {
      await userStore
          .collection("ProfileFull")
          .doc(id)
          .update({'name': nameIn, 'bio': bioIN}).then((_) {
        debugPrint("print success");
        print("success!");
      });
    } catch (e) {
      print(e);
    }
  }



  
}
