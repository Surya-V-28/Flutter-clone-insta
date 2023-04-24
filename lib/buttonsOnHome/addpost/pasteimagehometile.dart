import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:instagrambasics/buttonsOnHome/addpost/post.dart';
import 'package:instagrambasics/constants/post_json.dart';
import 'package:instagrambasics/nodyofinstapage/instabody.dart';

// ignore: unused_import
import '../../main.dart';

// ignore: must_be_immutable
class PastePostTile extends StatefulWidget {
  var index;

  var dataoflist;

  PastePostTile({
    Key? key,
    required this.index, required this. dataoflist,
  }) : super(key: key);

  @override
  _PastePostTileState createState() => _PastePostTileState();
}

class _PastePostTileState extends State<PastePostTile> {
  File? file;
  

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 65,
                  height: 65,
                  child: ClipOval(
                    child: SizedBox(
                      child: imageurls.isNotEmpty
                          ? Image.file(File(widget.dataoflist[0]["postImage"]))
                          : Image.asset(circularimage[4]),
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.red,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
                Text(
                  // thid line is error causing
                  //
                  //
                  //
                  //
                  // check here  
                   'hello',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              ],
            ),
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
            ),
            child: ClipRRect(
              child: SizedBox(
                child: widget.dataoflist.isNotEmpty
                    ? Image.file(
                        File(widget.dataoflist[0]['postImage']),
                        fit: BoxFit.fill,
                      )
                    : Image.asset(circularimage[4]),
              ),
            ),
          ),
          SizedBox(
            height: 1.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        print("hello world procrsss");
                        favchange == Colors.white
                            ? favchange = Colors.red
                            : favchange = Colors.white;
                        if (favchange == Colors.red) {
                          SnackBar mylikesnack = SnackBar(
                            content: Text('you liked the post'),
                          );
                          // ignore: deprecated_member_use
                          ScaffoldMessenger.of(context).showSnackBar(mylikesnack);
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
                    text: index == 3 ? posts[0]['name'] : posts[index]['name'],
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
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: posts[index]['name'],
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                  )),
                              TextSpan(
                                text:  'hello not thing is here',
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
      ),
    );
  }
  
}


class GetallthepostformDatabase extends StatefulWidget {
  GetallthepostformDatabase({Key? key}) : super(key: key);

  @override
  _GetallthepostformDatabaseState createState() => _GetallthepostformDatabaseState();
}

class _GetallthepostformDatabaseState extends State<GetallthepostformDatabase> {
  List? images = [];
  Future readthepostfromdata() async {
    // ignore: unused_local_variable

    QuerySnapshot querySnapshot;
    var readthedata = FirebaseFirestore.instance;
    try {
      querySnapshot = await readthedata.collection('PostImage').get();
      if (querySnapshot.docs.isNotEmpty) {
        // ignore: unused_local_variable
        for (var doc in querySnapshot.docs.toList()) {
          // ignore: unused_local_variable
          Map a = {
            "uid": doc['uid'],
            "postImage": doc['postfile'],
            "captions": doc['caption'],
            "timer": doc['time']
          };
          images!.add(a);
        }
        
      }
    } catch (e) {
      print(e);
    }
    return images;
  }

  @override
  void initState() {
    super.initState();
    readthepostfromdata();
   
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image for the things '),
      ),
      body :
      ListView.builder(
      itemCount: images!.length,
      itemBuilder: (BuildContext context, int index) {
      return PastePostTile(index: index,dataoflist : images);
     },
    ));
  }
}