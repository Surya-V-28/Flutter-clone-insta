



import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';

class Database {

  Future addthechatroomforuseranduser1 (String docid,Map<String, dynamic> usermapforchat) async {
    // ignore: unused_local_variable
    var datastore = FirebaseFirestore.instance.collection('ChatRoom ').doc(docid).set(usermapforchat).catchError((e){
      print('${e.toString}');
    });
  }

  Future  maketheconvoroom (String docid,Map<String, dynamic> newmessage) async {
    // ignore: unused_local_variable
    var datastores = FirebaseFirestore.instance.collection('ChatRoom').doc(docid).collection('Messages').add(newmessage).catchError(
      // ignore: body_might_complete_normally_catch_error
      (e) {
        print('${e.toString}');
      }
    );
  }

  Future getthedataforchat (String docid) async {
    return FirebaseFirestore.instance.collection('ChatRoom').doc(docid).collection('Messages').get();
  }
}