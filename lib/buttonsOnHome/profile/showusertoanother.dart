// ignore: avoid_web_libraries_in_flutter
// ignore: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:instagrambasics/buttonsOnHome/addpost/imageget.dart';
// ignore: unused_import
import 'package:instagrambasics/buttonsOnHome/profile/backend/setupusername.dart';
// ignore: unused_import
import 'package:instagrambasics/buttonsOnHome/profile/editprofileuser.dart';
import 'package:instagrambasics/chatbot/chatpage.dart';
import 'package:instagrambasics/constants/post_json.dart';
import 'package:instagrambasics/nodyofinstapage/instabody.dart';

// ignore: must_be_immutable
class ShowTheProfileToAnotherUser extends StatefulWidget {
  var uid;
  ShowTheProfileToAnotherUser({Key? key, required this.uid}) : super(key: key);
  @override
  _ShowTheProfileToAnotherUserState createState() =>
      _ShowTheProfileToAnotherUserState();
}

class _ShowTheProfileToAnotherUserState
    extends State<ShowTheProfileToAnotherUser> {
  @override
  void initState() {
    super.initState();
    debugPrint('this is uid ${widget.uid}');
    addtheusernamecurrentforchatsystem();
  }

  Map<String, dynamic>? usermap = {};
  Map<String, dynamic>? usermap1 = {};
  Map<String, dynamic>? chatmap = {};
  var currentuser = FirebaseAuth.instance.currentUser!.uid;
  var _currentIndex = 3;
  Future onsearchforuser(uid) async {
    debugPrint('this is uid   22  $uid');
    // ignore: await_only_futures
    var valuefirestore = await FirebaseFirestore.instance.collection('bioUser');
    valuefirestore
        .where("uid", isGreaterThanOrEqualTo: uid)
        .get()
        .then((value) {
      setState(() {
        usermap = value.docs[0].data();
      });
    }).catchError((e) {
      debugPrint(e.toString());
    });
    //print(usermap);
  }

  Future addtheusernamecurrentforchatsystem() async {
    var currentusers  = FirebaseAuth.instance.currentUser!.uid;
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
   // print(usermap1);
  }

   Future gethechatidyesorno (String name) async  {
     // ignore: unused_local_variable
     var firestore = FirebaseFirestore.instance.collection('chatbox').where("name", arrayContains: name).get().then((value){
         chatmap = value.docs[index].data();
     } ).catchError((e){
       debugPrint(e.toString());
     });
     debugPrint('this is chatmapp  $chatmap');
   }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: onsearchforuser(widget.uid.toString()),
        builder: (BuildContext context, index) {
          if (usermap!.isNotEmpty) {
            return Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                backgroundColor: Colors.black,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.lock),
                    Text(
                      usermap!['name'],
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    CircleAvatar(
                        radius: 09,
                        // ignore: unnecessary_null_comparison
                        backgroundImage: AssetImage('assets/down_arrow.png')),
                  ],
                ),
              ),
              body: ListView(scrollDirection: Axis.vertical, children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Stack(children: [
                          CircleAvatar(
                            radius: 38.7,
                            backgroundColor: Colors.red[700],
                            child: CircleAvatar(
                              radius: 35,
                              child: ClipOval(
                                  child: SizedBox(
                                      child: Image.network(
                                          usermap!['profileimag']))),
                            ),
                            // ignore: unnecessary_null_comparison
                          ),
                        ]),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          children: [
                            Text(
                              '84',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              'Posts',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '784',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              'Following',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              ' 1030',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              'Follwers',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: GestureDetector(
                            onTap: () {},
                            child: usermap!.isEmpty
                                ? Text(
                                    ' no loaded',
                                    style: TextStyle(color: Colors.white),
                                  )
                                : Text(
                                    usermap!['name'],
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: usermap!.isEmpty
                              ? Text('digital every thing is good',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ))
                              : Text(
                                  usermap!['about'],
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            usermap!.isEmpty ? 'not loaded' : usermap!['more'],
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                            color: Colors.blueAccent,
                            width: 199.0,
                            child: Container(
                              width: 100,
                              color: Colors.blue,
                              child: OutlinedButton(
                                onPressed: () {
                                  debugPrint('nameofperson');
                                },
                                child: Center(
                                    child: Text(
                                  'Follow',
                                  style: TextStyle(color: Colors.white),
                                )),
                              ),
                            )),
                        Container(
                            color: Colors.greenAccent,
                            width: 199,
                            child: Container(
                              width: 100,
                              color: Colors.green,
                              child: OutlinedButton(
                                onPressed: () async {
                                  // ignore: unused_local_variable
                                  var currentuserid =
                                      FirebaseAuth.instance.currentUser!.uid;
                                  // ignore: unused_local_variable
                                  var peruserid = widget.uid.toString();
                                  // ignore: unused_local_variable
                                  // ignore: unnecessary_brace_in_string_interps
                                  var listuserid = [
                                    '${currentuserid}_${peruserid.toString()}',
                                    '${peruserid.toString()}_${currentuserid.toString()}'
                                  ];
                                  var listforusers = [currentuserid,peruserid];
                                  // ignore: unused_local_variable
                                chatmap!.isEmpty ? await FirebaseFirestore
                                      .instance
                                      .collection('chatbox')
                                      .doc(listuserid[0])
                                      .set({
                                    "name": listuserid,
                                    "idchatbox": listuserid[0],
                                    "users":listforusers,
                                    "username1":usermap!['name'],
                                    "username2":usermap1!['name'],
                                  }).catchError((e) {
                                    debugPrint('hello error');
                                  }):
                                  
                                  Navigator.push(context,MaterialPageRoute(builder: (context) =>ChatMessageForUser(chatid: chatmap!['idchatbox'],)));
                                  debugPrint('success for creatred room ');
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ChatMessageForUser(
                                                  chatid: listuserid[0])));
                                },
                                child: Center(
                                    child: Text(
                                  'message',
                                  style: TextStyle(color: Colors.white),
                                )),
                              ),
                            )),
                      ],
                    ),
                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          child: Text(
                            'This account is privite',
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ))
                  ],
                ),
              ]),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: _currentIndex,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    // ignore: deprecated_member_use
                    label: "",
                    backgroundColor: Colors.black,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search_sharp),
                    // ignore: deprecated_member_use
                    label: "",
                    backgroundColor: Colors.black,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.add),
                    // ignore: deprecated_member_use
                    label: "",
                    backgroundColor: Colors.black,
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.favorite,
                    ),
                    // ignore: deprecated_member_use
                    label: "",
                    backgroundColor: Colors.black,
                  ),
                  BottomNavigationBarItem(
                    icon: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.black,
                        backgroundImage: AssetImage(circularimage[7])),
                    // ignore: deprecated_member_use
                    label: "",
                    backgroundColor: Colors.black,
                  )
                ],
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                    if (_currentIndex == 0) {
                      Navigator.pushNamed(context, '/instahome');
                    } else if (_currentIndex == 1) {
                      Navigator.pushNamed(context, '/search');
                    } else if (_currentIndex == 2) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ImageGetter()));
                    } else if (_currentIndex == 3) {
                      Navigator.pushNamed(context, '/likes');
                    } else {
                      Navigator.pushNamed(context, '/profilepage');
                    }
                  });
                },
              ),
            );
          } else {
            return SpinKitFadingCircle(
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: index.isEven ? Colors.white : Colors.blue,
                  ),
                );
              },
            );
          }
        });
  }
}
