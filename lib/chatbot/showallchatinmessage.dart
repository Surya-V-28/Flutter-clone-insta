
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagrambasics/chatbot/chatpage.dart';

class Showalluserschat extends StatefulWidget {
  Showalluserschat({Key? key}) : super(key: key);

  @override
  _ShowalluserschatState createState() => _ShowalluserschatState();
}

class _ShowalluserschatState extends State<Showalluserschat> {
  var name = FirebaseAuth.instance.currentUser!.uid;
  Map<String, dynamic>? usermap1 = {};
  @override
  void initState() {
    super.initState();
    addtheusernamecurrentforchatsystem();
  }

  Future addtheusernamecurrentforchatsystem() async {
    var currentusers = FirebaseAuth.instance.currentUser!.uid;
    // ignore: await_only_futures
    var valuefirestore = await FirebaseFirestore.instance.collection('bioUser');
    valuefirestore
        .where("uid", isGreaterThanOrEqualTo: currentusers)
        .get()
        .then((value) {
      setState(() {
        usermap1 = value.docs[0].data();
      });
    }).catchError((e) {
      debugPrint(e.toString());
    });
    print('this is usermap' +'$usermap1');
  }
  searchforthechatlist () async {
        var currentusers = FirebaseAuth.instance.currentUser!.uid;

    // ignore: unused_local_variable
    var firestore = FirebaseFirestore.instance.collection('chatbox').where("users", arrayContains: currentusers).get().then((value) 
    {
      
    }).catchError((e){
      print(' this is error ');
      debugPrint(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('chatpage'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        // ignore: unnecessary_null_comparison
        stream: (name != "" && name != null)
            ? FirebaseFirestore.instance
                .collection('chatbox')
                .where("users", arrayContains: name)
                .snapshots()
            : FirebaseFirestore.instance.collection("chatbox").snapshots(),
        builder: (context, snapshot) {
          return (snapshot.connectionState == ConnectionState.waiting)
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot data = snapshot.data!.docs[index];
                    // ignore: unnecessary_null_comparison
                    return (data['username1']!= usermap1!['name'] )
                        ? Card(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatMessageForUser(chatid:data['idchatbox'] ,)));
                              },
                              child: index <= 2
                               ?Text(
                                data['username1'],
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                ),
                              ): Container(),
                            ),
                          )
                        : Card(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatMessageForUser(chatid:data['idchatbox'] ,)));
                              },
                              child: index <= 2
                               ?Text(
                                data['username2'],
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                ),
                              ): Container(),
                            ),
                          );
                  });
        },
      ),
    );
  }
}
