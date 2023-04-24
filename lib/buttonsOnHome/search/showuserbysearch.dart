import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instagrambasics/buttonsOnHome/addpost/imageget.dart';
import 'package:instagrambasics/constants/post_json.dart';

// ignore: must_be_immutable
class ShowAnotheruserBySearch extends StatefulWidget {
  var uid;

  ShowAnotheruserBySearch({Key? key, required this.uid}) : super(key: key);

  @override
  _ShowAnotheruserBySearchState createState() =>
      _ShowAnotheruserBySearchState();
}

class _ShowAnotheruserBySearchState extends State<ShowAnotheruserBySearch> {
  var _currentIndex = 2;
  Map<String, dynamic> usermap = {};
  Future searchforuserprofile(d) async {
    debugPrint('this is uid $d');
    // ignore: unused_local_variable
    var us = await FirebaseFirestore.instance
        .collection('bioUser')
        .doc(d)
        .get()
        .then((value) {
      usermap = value.data()!;
    }).catchError((e) {
      print(e.toString());
      print('error');
    });

    print(usermap);
    print('this is fulluser ' + usermap.toString());
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('bioUser').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        // DocumentSnapshot ds = snapshot.data!.doc(widget.uid);
        //debugPrint(ds['uid']);
        if (widget.uid != null) {
          return FutureBuilder(
              future: searchforuserprofile(widget.uid),
              builder: (context, index) {
                return Scaffold(
                  backgroundColor: Colors.black,
                  appBar: AppBar(
                    backgroundColor: Colors.black,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.lock),
                        Text(
                          usermap['name'],
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        CircleAvatar(
                            radius: 09,
                            // ignore: unnecessary_null_comparison
                            backgroundImage:
                                AssetImage('assets/down_arrow.png')),
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
                                          child: usermap.isEmpty
                                              ? Container(
                                                  color: Colors.blue,
                                                )
                                              : Image.network(
                                                  usermap['profileimag']))),
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
                                child: usermap.isEmpty
                                    ? Text(
                                        ' no loaded',
                                        style: TextStyle(color: Colors.white),
                                      )
                                    : Text(
                                        usermap['name'],
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
                              child: usermap.isEmpty
                                  ? Text('digital every thing is good',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ))
                                  : Text(
                                      usermap['about'],
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                            ),
                            Text(
                              "hello click here to sign in",
                            )
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
                                'digital every thing is good@warkilled ',
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
                                      var currentuserid = FirebaseAuth
                                          .instance.currentUser!.uid;
                                      // ignore: unused_local_variable
                                      var peruserid = widget.uid;
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
                              height: 300,
                              width: 115,
                              color: Colors.red,
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
              });
        } else {
          return Center(
            child: CircularProgressIndicator(
              strokeWidth: 50,
              color: Colors.green,
            ),
          );
        }
      },
    );
  }
}
