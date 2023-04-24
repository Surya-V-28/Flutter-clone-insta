
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:instagrambasics/chatbot/showallchatinmessage.dart';
// ignore: unused_import
import 'package:instagrambasics/constants/post_json.dart';

// ignore: must_be_immutable
class ChatMessageForUser extends StatefulWidget {
  var chatid;

  ChatMessageForUser({Key? key, required this.chatid}) : super(key: key);

  @override
  _ChatMessageForUserState createState() => _ChatMessageForUserState();
}

class _ChatMessageForUserState extends State<ChatMessageForUser> {
  TextEditingController messageController = TextEditingController();
  var usermap = {};
  @override
  void initState() {
    super.initState();
    getusername();
  }

  // ignore: non_constant_identifier_names
  Future getusername() async {
    // ignore: unused_local_variable
    var curretnuid = FirebaseAuth.instance.currentUser!.uid;

    // ignore: unused_local_variable
    var firestore = FirebaseFirestore.instance
        .collection('bioUser')
        .where("uid", isEqualTo: curretnuid)
        .get()
        .then((value) {
      setState(() {
        usermap = value.docs[0].data();
      });
     // print(usermap);
    });
   // print(usermap);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text('Chat With Friend'),
        leading: IconButton(onPressed: () {
          Navigator.push(context,MaterialPageRoute(builder: (context)=> Showalluserschat()));
        }, icon: Icon(Icons.mail),),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('chatbox')
                  .doc(widget.chatid)
                  .collection('message')
                  .orderBy('time')
                  .snapshots(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return snapshot.hasData
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          DocumentSnapshot ds = snapshot.data!.docs[index];
                          return  index%2==0 ?
                          Padding(
                            padding: const EdgeInsets.only(left: 50,bottom:10.0,top: 20.0,),
                            child: Container(
                              height:30,
                              color: 
                                  Colors.yellow,
                                  
                              child: Text(
                                  '${ds['message']}',
                                  style: TextStyle(),
                                ),
                              
                            ),
                          ):
                          Padding(
                            padding: const EdgeInsets.only(right:50.0,bottom:10.0,top: 20.0,),
                            child: Container(
                              
                              color: 
                                   Colors.red,
                              child: Text(
                                '${ds['message']}',
                                style: TextStyle(),
                              ),
                            ),
                          );
                        },
                      )
                    : Container(
                        child: Text('wrongsd'),
                      );
              },
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 160,
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(hintText: 'Chat here'),
                  ),
                ),
                IconButton(
                  
                  onPressed: () async {
                    var  timer = DateTime.now();
                    //await
                    // ignore: unnecessary_null_comparison
                    (messageController.text == "" ||
                            // ignore: unnecessary_null_comparison
                            messageController.text == null)
                        ? debugPrint('statement no text')
                        :
                    await addthechatmessagetosender(
                        messageController.text, usermap['name'], timer);
                    messageController.text = "";
                  },
                  icon: Icon(
                    Icons.send_and_archive,
                    color: Colors.white,
                  ),
                  color: Colors.blue,
                  tooltip: 'Send message',
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Future addthechatmessagetosender(String text, usermap, DateTime timer) async {
    // ignore: unused_local_variable
    var firestore = await FirebaseFirestore.instance
        .collection('chatbox')
        .doc(widget.chatid)
        .collection('message')
        .add({"message": text, "name": usermap, "time": timer}).then((value) {
      debugPrint('hello nice to meett you ');
    });
  }
}
