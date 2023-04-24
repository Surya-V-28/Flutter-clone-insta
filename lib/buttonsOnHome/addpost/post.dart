// ignore: unused_import, unnecessary_import
import 'dart:async';
import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: unnecessary_import
import 'package:flutter/foundation.dart';
// ignore: unused_import
import 'package:instagrambasics/buttonsOnHome/addpost/checker.dart';
// ignore: unused_import
import 'package:instagrambasics/buttonsOnHome/addpost/databasehelp.dart';
// ignore: unused_import
import 'package:instagrambasics/buttonsOnHome/addpost/pasteimagehometile.dart';
import 'package:instagrambasics/constants/post_json.dart';
// ignore: unused_import
import 'package:instagrambasics/nodyofinstapage/instabody.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:instagrambasics/signpages/singin.dart';
// ignore: unused_import
import 'package:transparent_image/transparent_image.dart';
// ignore: unused_import
import '../../main.dart';

List<Map> imageurls = [];

// ignore: must_be_immutable
class PostPageforCreating extends StatefulWidget {
  var databasepost;

  var secondurls;

  var path;
  PostPageforCreating({
    Key? key,
    required this.image,
    required this.uid,
    required this.path,
  }) : super(key: key);
  var image;
  var uid;
  @override
  _PostPageforCreatingState createState() => _PostPageforCreatingState();
}

class _PostPageforCreatingState extends State<PostPageforCreating> {
  bool boolforfeabook = false;
  bool boolfortwitter = false;
  bool boolfortinder = false;
  bool checkerforimage = true;
  List docfromdatabase = [];
  String? auth = FirebaseAuth.instance.currentUser!.uid;
  var user;
  List usermap1 = [];
  TextEditingController captioncontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    debugPrint('${widget.path}');
    //takeimage();
  }

  Future takeimage() async {
    QuerySnapshot querySnapshot;

    try {
      querySnapshot =
          await FirebaseFirestore.instance.collection('posts').get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map a = {'urls': doc['urlsforpost']};
          docfromdatabase.add(a);
        }
        debugPrint('$docfromdatabase');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          title: Text(
            'New Post',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: () async {
                // ignore: unused_local_variable
                Navigator.pushNamed(context, '/instahome');
              },
              icon: Icon(Icons.send_and_archive_rounded),
            )
          ]),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Container(
                width: 100,
                height: 100,
                child: ClipRect(
                  child: widget.path == null
                      ? Text(
                          'hi',
                          style: TextStyle(color: Colors.white),
                        )
                      : Image.network(widget.path),
                ),
              ),
              Container(
                width: 270,
                child: TextField(
                  controller: captioncontroller,
                  decoration: InputDecoration(
                      hintText: 'Write a caption for it',
                      hintStyle:
                          TextStyle(color: Colors.white.withOpacity(0.4))),
                ),
              )
            ],
          ),
          Divider(
            color: Colors.white,
          ),
          ListTile(
            title: Text(
              'tag people',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {},
          ),
          Divider(
            color: Colors.white,
          ),
          ListTile(
            title: Text(
              ' add lociation',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {},
          ),
          Divider(
            color: Colors.white,
          ),
          Column(
            children: [
              ListTile(
                title: Text(
                  ' also post on',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                  title: Text(
                    'FaceBoook',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {},
                  trailing: Transform.scale(
                      scale: 1.5,
                      child: Switch.adaptive(
                          activeColor: Colors.blue,
                          inactiveTrackColor: Colors.grey,
                          value: boolforfeabook,
                          onChanged: (value) =>
                              setState(() => this.boolforfeabook = value)))),
              SizedBox(
                height: 10,
              ),
              ListTile(
                  title: Text(
                    'Twitter',
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: Transform.scale(
                    scale: 1.5,
                    child: Switch.adaptive(
                        inactiveTrackColor: Colors.grey,
                        value: boolfortwitter,
                        onChanged: (value) =>
                            setState(() => this.boolfortwitter = value)),
                  )),
              SizedBox(
                height: 10,
              ),
              ListTile(
                  title: Text(
                    'tinder',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {},
                  trailing: Transform.scale(
                    scale: 1.5,
                    child: Switch.adaptive(
                        inactiveTrackColor: Colors.grey,
                        value: boolfortinder,
                        onChanged: (value) =>
                            setState(() => this.boolfortinder = value)),
                  )),
              Divider(color: Colors.white)
            ],
          ),
          // ignore: deprecated_member_use
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
              onPressed: () async {
                // ignore: await_only_futures
                var currenttimer = await makeTimer();
                // ignore: unused_local_variable
                String? things = await addthepostimageindoc(
                    auth!, widget.path, captioncontroller.text, currenttimer);
                Navigator.pushNamed(context, '/instahome');
                //// debugPrint(' this in port dart page' + things!);
              },
              child: Text(
                'save profile',
                style: TextStyle(color: Colors.white.withOpacity(0.3)),
              ))
        ],
      ),
    );
  }

  Future addthepostimageindoc(
      String uid, var copiedimage, String captions, List time) async {
    var poststore = FirebaseFirestore.instance.collection('PostImage');
    // ignore: await_only_futures
    await poststore.add({
      "uid": uid,
      "postfile": copiedimage,
      "caption": captions,
      "time": time
    });
    imageurls.add({
      "uid": uid,
      "postfile": copiedimage,
      "caption": captions,
      "time": time
    });
    return print({
      "uid": uid,
      "postfile": copiedimage,
      "caption": captions,
      "time": time
    });
  }

  Transform switchtoggle(bool value) {
    return Transform.scale(
        scale: 1.5,
        child: Switch.adaptive(
            activeColor: Colors.blue,
            inactiveTrackColor: Colors.grey,
            value: value,
            onChanged: (value) => setState(() => value = value)));
  }

  List makeTimer() {
    List timer = [];
    DateTime now = DateTime.now();
    timer.add(now);

    int hour = now.hour;
    timer.add(hour);
    int min = now.minute;
    timer.add(min);
    int month = now.month;
    timer.add(month);
    int year = now.year;
    timer.add(year);
    int day = now.day;
    timer.add(day);
    return timer;
  }

  /// to create the post then upload it in the home page

}

Column bodyofInsta(int indexnumber) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(children: [
          Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.red,
                ),
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(posts[indexnumber]['profileImg']),
                  fit: BoxFit.cover,
                )),
          ),
          SizedBox(
            width: 15.0,
          ),
          Text(
            index == 0 ? posts[index]['name'] : posts[indexnumber]['name'],
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ]),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_horiz_outlined,
            color: Colors.white,
          ),
        ),
      ]),
      SizedBox(
        height: 1.0,
      ),
      Container(
        height: 500.0,
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
            ),
            image: DecorationImage(
              image: NetworkImage(posts[indexnumber]['postImg']),
              fit: BoxFit.cover,
            )),
      ),
      SizedBox(
        height: 1.0,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite,
                  size: 30.0,
                  color: favchange,
                )),
            SizedBox(
              width: 10.0,
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.comment_bank_rounded,
                  color: Colors.white,
                  size: 30.0,
                )),
            SizedBox(
              width: 10.0,
            ),
            IconButton(
                onPressed: () {},
                icon: Container(
                  height: 50.0,
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    child: Image(
                      image: AssetImage('assets/chatters.png'),
                      height: 300.0,
                    ),
                  ),
                )),
          ]),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.save,
                color: Colors.white,
                size: 30.0,
              )),
        ],
      ),
      SizedBox(
        height: 1.0,
      ),
      Padding(
        padding: const EdgeInsets.only(right: 230.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: 'Liked by  ',
                  style: TextStyle(
                    fontSize: 15.0,
                  )),
              TextSpan(
                text: indexnumber == 3
                    ? posts[0]['name']
                    : posts[indexnumber]['name'],
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                  text: ' and other',
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  )),
            ])),
          ],
        ),
      ),
      SizedBox(
        height: 5.0,
      ),
      Column(
        children: [
          Column(children: [
            Padding(
              padding: const EdgeInsets.only(right: 200.0, left: 0.0),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: posts[indexnumber]['name'],
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          )),
                      TextSpan(
                        text: posts[indexnumber]['caption'],
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 270.0),
              child: Text(
                'veiw 12 comments',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.4),
                ),
              ),
            ),
            SizedBox(
              height: 3.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blue,
                          ),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(posts[index]['profileImg']),
                            fit: BoxFit.cover,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'add a coment...',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.4),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.emoji_emotions,
                          color: Colors.yellow,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add,
                          color: Colors.grey,
                        ))
                  ],
                ),
              ],
            ),
          ]),
        ],
      ),
    ],
  );
}
