import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  Future getData(String collection) async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection(collection).get();
    return snapshot.docs;
  }

  // ignore: non_constant_identifier_names
  Future searchdata(String Search) async {
    return await FirebaseFirestore.instance
        .collection('ProfilePage')
        .where('name', isEqualTo: Search)
        .get();
        
  }
  @override
  void onInit() {
    // ignore: todo
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  InternalFinalCallback<void> get onDelete => super.onDelete;
  @override
  void onReady() {
    super.onReady();
  }
}