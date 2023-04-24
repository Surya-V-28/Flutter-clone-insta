
// ignore: unused_import
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:instagrambasics/constants/post_json.dart';

class MessagePage extends StatefulWidget {
  MessagePage({Key? key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  List allchats = [];
  Map<String,dynamic> usermap = {};
  @override
  void initState() {
    super.initState();
    
  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('jacob_w '),
              CircleAvatar(
                radius: 09,
                backgroundImage: AssetImage('assets/down_arrow.png'),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            width: 70,
            height: 60,
            decoration:
                BoxDecoration(shape: BoxShape.rectangle, color: Colors.grey),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                  decoration: InputDecoration(
                      fillColor: Colors.green,
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      hintText: 'Search',
                      focusColor: Colors.green)),
            ),
          ),
          nameWithChat('johnson', 'how are you man, long time ', 'now',1),
          nameWithChat('micahal', 'sounds funny', 'now',2),
          nameWithChat('kilerus', 'how was windows 11 man...', '21h',3),
          nameWithChat('bery', 'i need to made thhethings.. ', '1d',4),
          nameWithChat('allen', 'hey whats up', '2d',5),
          nameWithChat('joe', 'i gotta go , son', '2d',6),
          nameWithChat('oliver', 'you have to focus ...', '2d',7),
          nameWithChat('pelicipi', 'where did you been long year', '3d',0),
          nameWithChat('gladson', 'how was the holiday trip', '3d',2),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
            icon: Icon(
              Icons.camera_alt_rounded,
              color: Colors.blue[600],
            ),
            // ignore: deprecated_member_use
            label: 'Camera'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.camera_alt_rounded,
              color: Colors.blue[600],
            ),
            // ignore: deprecated_member_use
            label: 'Camera1')
      ]),
    );
  }

  ListTile nameWithChat(
      String nameofperson, String chat, String time,int indeses) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(postimage[indeses]),
        radius: 26,
      ),
      title: Text(
        '$nameofperson',
        style: TextStyle(color: Colors.white),
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 200,
            child: Text('$chat',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.3),
                )),
          ),
          Text('$time',
              style: TextStyle(
                color: Colors.white.withOpacity(0.3),
              )),
        ],
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.camera_alt_outlined,
          color: Colors.white.withOpacity(0.5),
          size: 35,
        ),
        onPressed: () {},
      ),
    );
  }
}
