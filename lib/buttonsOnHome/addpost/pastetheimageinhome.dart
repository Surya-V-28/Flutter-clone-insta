import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:instagrambasics/buttonsOnHome/profile/showusertoanother.dart';
// ignore: unused_import
import 'package:instagrambasics/constants/post_json.dart';
import 'package:instagrambasics/nodyofinstapage/fullstoryfunction.dart';
import 'package:instagrambasics/nodyofinstapage/instabody.dart';
// ignore: unused_import
import 'package:transparent_image/transparent_image.dart';

class Pastetheimages extends StatefulWidget {
  Pastetheimages({Key? key}) : super(key: key);

  @override
  _PastetheimagesState createState() => _PastetheimagesState();
}

class _PastetheimagesState extends State<Pastetheimages> {
  // ignore: non_constant_identifier_names
  List FullUser = [];
  // ignore: non_constant_identifier_names
  Map<String, dynamic> usermap = {};
  Future searchforuserprofile(d) async {
    // ignore: unused_local_variable
    var us = await FirebaseFirestore.instance
        .collection('bioUser')
        .doc(d)
        .get()
        .then((value) {
      usermap = value.data()!;
    });
    FullUser.add(usermap);
    print(FullUser);
    print('this is fulluser ' + FullUser.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: StreamBuilder<QuerySnapshot>(
          stream:
              FirebaseFirestore.instance.collection('PostImage').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    //ignore: unused_local_variable
                    DocumentSnapshot ds = snapshot.data!.docs[index];
                    return FutureBuilder(
                        future: searchforuserprofile(ds['uid']),
                        builder: (context, snapshot) {
                          if (FullUser.isNotEmpty) {
                            return Column(
                              children: [
                                //ignore: unrelated_type_equality_checks
                                index == 0 ? StroyScrollable() : Container(),
                                Column(
                                  children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    debugPrint(ds['uid']);
                                                    var currentuser =
                                                        FirebaseAuth.instance
                                                            .currentUser!.uid;
                                                    currentuser == ds['uid']
                                                        ? Navigator.pushNamed(
                                                            context,
                                                            '/profilepage')
                                                        : Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (BuildContext
                                                                        context) =>
                                                                    ShowTheProfileToAnotherUser(
                                                                        uid: ds[
                                                                            'uid'])));
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                          width: 65,
                                                          height: 65,
                                                          child: ClipOval(
                                                            child: SizedBox(
                                                                // ignore: unnecessary_null_comparison
                                                                child:
                                                                    CircleAvatar(
                                                              backgroundColor:
                                                                  Colors.black,
                                                              child: FullUser
                                                                      .isEmpty
                                                                  ? Container(
                                                                      color: Colors
                                                                          .green)
                                                                  : Image.network(
                                                                      FullUser[
                                                                              index]![
                                                                          'profileimag']),
                                                            )),
                                                          )),
                                                      SizedBox(
                                                        width: 15.0,
                                                      ),
                                                      Text(
                                                        // ignore: unnecessary_null_comparison
                                                        FullUser.isEmpty
                                                            ? 'hello not loaded'
                                                            : FullUser[index]![
                                                                'name'],
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
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
                                      height: 500,
                                      color: Colors.green,
                                      child: Stack(children: [
                                        Center(
                                          child: CircularProgressIndicator(
                                            color: Colors.green,
                                          ),
                                        ),
                                        FadeInImage.memoryNetwork(
                                            height: 450,
                                            fadeInDuration:
                                                Duration(seconds: 1),
                                            placeholder: kTransparentImage,
                                            image: ds['postfile']),
                                      ]),
                                    ),
                                    SizedBox(
                                      height: 1.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(children: [
                                          IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  print("hello world procrsss");
                                                  favchange == Colors.white
                                                      ? favchange = Colors.red
                                                      : favchange =
                                                          Colors.white;
                                                  if (favchange == Colors.red) {
                                                    SnackBar mylikesnack =
                                                        SnackBar(
                                                      content: Text(
                                                          'you liked the post'),
                                                    );
                                                    // ignore: deprecated_member_use
                                                    ScaffoldMessenger.of(context)
                                                        // ignore: deprecated_member_use
                                                        .showSnackBar(
                                                            mylikesnack);
                                                  }
                                                });
                                              },
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
                                                    image: AssetImage(
                                                        'assets/chatters.png'),
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
                                      padding: const EdgeInsets.only(
                                          left: 0, right: 335),
                                      child: Text(
                                        '${ds['time'][5]}/${ds['time'][3]}/${ds['time'][4]}',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 230.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          RichText(
                                              text: TextSpan(children: [
                                            TextSpan(
                                                text: 'Liked by  ',
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                )),
                                            TextSpan(
                                              text: index == 3
                                                  ? posts[0]['name']
                                                  : posts[index]['name'],
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
                                            padding: const EdgeInsets.only(
                                                right: 200.0, left: 0.0),
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  RichText(
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                            // ignore: unnecessary_null_comparison
                                                            text:
                                                                FullUser[index]
                                                                    ['name'],
                                                            style: TextStyle(
                                                              fontSize: 15.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            )),
                                                        TextSpan(
                                                          text: ds['caption'] ==
                                                                  null
                                                              ? 'heloo'
                                                              : ds['caption'],
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
                                            padding: const EdgeInsets.only(
                                                right: 270.0),
                                            child: Text(
                                              'veiw 12 comments',
                                              style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.4),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 3.0,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
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
                                                          image: NetworkImage(
                                                              FullUser[index][
                                                                  'profileimag']),
                                                          fit: BoxFit.cover,
                                                        )),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0),
                                                    child: Text(
                                                      'add a coment...',
                                                      style: TextStyle(
                                                        color: Colors.white
                                                            .withOpacity(0.4),
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
                                ),
                              ],
                            );
                          } else {
                            return SpinKitRotatingCircle(
                              color: Colors.black,
                              size: 50.0,
                            );
                          }
                        });
                  });

              //
              //isswe(index, ds, context, userprofile);
            } else {
              return SpinKitRotatingCircle(
                color: Colors.white,
                size: 50.0,
              );
            }
          },
        ));
  }
}
