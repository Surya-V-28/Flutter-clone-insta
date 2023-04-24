// ignore: unused_import
import 'dart:async' show Future;
// ignore: unused_import
import "dart:io";
// ignore: unused_import
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagrambasics/buttonsOnHome/addpost/imageget.dart';
// ignore: unused_import
import 'package:instagrambasics/buttonsOnHome/addpost/post.dart';
// ignore: unused_import
import 'package:instagrambasics/buttonsOnHome/profile/editprofileuser.dart';
import 'package:instagrambasics/constants/post_json.dart';
 
int _currentIndex = 4;

// ignore: must_be_immutable
class ProfilePage extends StatefulWidget {
  var controller;
  ProfilePage({Key? key})
      : super(
          key: key,
        );

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late XFile imageforuser;
  String name = '';

  Map<String, dynamic>? usermap = {};
  var currentuser = FirebaseAuth.instance.currentUser!.uid;
  bool isloading = false;

  void onsearchforuser() async {
    // ignore: await_only_futures
    var valuefirestore = await FirebaseFirestore.instance.collection('bioUser');
     valuefirestore
        .where("uid", isEqualTo: currentuser)
        .get()
        .then((value) {
      setState(() {
        usermap = value.docs[0].data();
      });
    });
    print(usermap);
  }
  void nothing () {

  }
  @override
  void initState() {
    super.initState();
    currentuser.isEmpty?
    nothing()
    :onsearchforuser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.lock),
            Text(
              usermap!['name'] ==null  ?
              'not loaded;':
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
        actions: [
          
        ],
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
                              child: usermap!.isEmpty
                                  ? Container(
                                      color: Colors.blue,
                                    )
                                  : Image.network(usermap!['profileimag'])
                                      
                                    
                                    )),
                        ),
                        // ignore: unnecessary_null_comparison
                      ) ,
                 
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
                    'digital every thing is good@warkilled ' ,
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
            Container(
                color: Colors.white,
                width: 340.0,
                child: Container(
                  width: 310,
                  color: Colors.black,
                  child: OutlinedButton(
                    onPressed: () {
                      debugPrint('nameofperson');
                      Navigator.pushNamed(context, '/editprofile');
                    },
                    child: Center(
                        child: Text(
                      'Edilt Profile',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                )),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: photolayoutarrangement())
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ImageGetter()));
              } else if (_currentIndex == 3) {
                Navigator.pushNamed(context, '/likes');
              } else {
                Navigator.pushNamed(context, '/profilepage');
              }
            });
        },
      ),
    );
  }

  Column photolayoutarrangement() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [bigphoto(0), hightphoto(1), bigphoto(2)],
        ),
        Row(
          children: [
            bigphoto(5),
            hightphoto(6),
            bigphoto(7),
          ],
        ),
        Row(
          children: [
            bigphoto(8),
            hightphoto(9),
            bigphoto(10),
          ],
        ),
        Row(
          children: [
            bigphoto(4),
            hightphoto(3),
            bigphoto(1),
          ],
        ),
        Row(
          children: [
            bigphoto(0),
            hightphoto(6),
            bigphoto(9),
          ],
        ),
        Row(
          children: [
            bigphoto(11),
            hightphoto(2),
            bigphoto(3),
          ],
        ),
        Row(
          children: [bigphoto(4), hightphoto(2), bigphoto(6)],
        ),
        Row(
          children: [
            bigphoto(9),
            hightphoto(5),
            bigphoto(3),
          ],
        ),
        Row(
          children: [
            bigphoto(7),
            bigphoto(2),
            hightphoto(10),
          ],
        ),
      ],
    );
  }

  Future<void> takeimage(ImageSource sesource) async {
    // ignore: deprecated_member_use
    // ignore: unused_local_variable

    // ignore: unused_local_variable
    final XFile? image = await ImagePicker()
        .
        // ignore: deprecated_member_use
        pickImage(source: sesource);
    setState(() {
      imageforuser = image!;
    });
  }

  Widget bottonsheet() {
    return Container(
      color: Colors.black54,
      height: 120,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Center(
              child: Text(
            'add profile photo',
            style: TextStyle(
              color: Colors.black26,
              fontWeight: FontWeight.bold,
            ),
          )),
          Divider(
            color: Colors.white,
            thickness: 3,
          ),
          SizedBox(
            height: 10,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              width: 20,
            ),
            // ignore: deprecated_member_use
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black26,
              ),
              onPressed: () {
                takeimage(ImageSource.camera);
              },
              icon: Icon(Icons.camera),
              label: Text('camera'),
            ),

            SizedBox(
              width: 20,
            ),
            // ignore: deprecated_member_use
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black12,
              ),
              onPressed: () {
                takeimage(ImageSource.gallery);
              },
              icon: Icon(Icons.image),
              label: Text('gallery'),
            ),
          ])
        ],
      ),
    );
  }

  GestureDetector hightphoto(int indexnumber) {
    return GestureDetector(
      child: Image(
        image: AssetImage(circularimage[indexnumber]),
        width: 200,
        height: 100,
      ),
      onTap: () {},
    );
  }

  GestureDetector bigphoto(int indexnumber) {
    return GestureDetector(
      child: Image(
        image: AssetImage(circularimage[indexnumber]),
        width: 203,
        height: 150,
      ),
      onTap: () {},
    );
  }

  // ignore: non_constant_identifier_names
}

// ignore: camel_case_types
class buttonforsearchpage extends StatelessWidget {
  const buttonforsearchpage({
    Key? key,
    // ignore: non_constant_identifier_names
    required this.Name,
    required this.iconsforbutton,
  }) : super(key: key);

  // ignore: non_constant_identifier_names
  final String Name;
  final IconData? iconsforbutton;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Container(
        color: Colors.black12,
        height: 30.0,
        child:
            // ignore: deprecated_member_use
            ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black12,
          elevation: 20.0,
          ),
          child: Row(
            children: [
              iconsforbutton == null
                  ? Text('')
                  : Icon(
                      iconsforbutton,
                      color: Colors.white24,
                    ),
              Text(
                '$Name',
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class searchforuserdetails {
  Future searchtheuid(String uid) async {
    Map<String, dynamic> usermap2 = {};
    // ignore: await_only_futures
    var userdetails = await FirebaseFirestore.instance.collection('bioUser');
    userdetails.where("uid", isEqualTo: uid).get().then((value) {
      usermap2 = value.docs[0].data();
    });
    return usermap2;
  }
}
