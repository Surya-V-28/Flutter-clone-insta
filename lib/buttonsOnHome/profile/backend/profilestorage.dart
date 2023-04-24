

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class DataBaseForUserProfileName {
  late FirebaseFirestore biostore;
  initiliaseforusernamebioMore() {
    biostore = FirebaseFirestore.instance;
  }

  Future<void> addBio(String uid, String displayname, String bioforuseruid,
      String moreinfo) async {
    try {
      await biostore
          .collection('bioUser')
          .add({"id":uid,"name": displayname, "bio": bioforuseruid, "more": moreinfo});
    } catch (e) {
      print(e);
    }
      }
    // to read the data which was create by the user when logged in
    // ignore: unused_element
    Future<List?> readthenameBioMore(String uid) async {
      QuerySnapshot querySnapshot;
      List docss = [];
      try {
        querySnapshot = await biostore.collectionGroup('bioUser').where('uid', isEqualTo: uid).get();
        if (querySnapshot.docs.isNotEmpty) {
          debugPrint('success fullly update the data for user');
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
    // here we will import the update request for the user for his name and everthing 
    // ignore: non_constant_identifier_names
    Future<void> UpdateUserDataUsername(String uid,String namechange,String bioIN, String more) async {
      try {
        await biostore.collection('bioUser').doc(uid).update({
             'name': namechange, 'bio': bioIN,"more":more
        });
      } catch (e) {
        print(e);
      }
    }
  }

