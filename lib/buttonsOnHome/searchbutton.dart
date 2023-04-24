import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:get/get.dart';
// ignore: unused_import
import 'package:instagrambasics/buttonsOnHome/profile/showusertoanother.dart';
import 'package:instagrambasics/buttonsOnHome/search/secondtime.dart';
import 'package:instagrambasics/constants/post_json.dart';

int _currentIndex = 1;

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  IconData iconforButton = Icons.search;
  TextEditingController searchtext = TextEditingController();
  bool searcch = false;
  var text;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black12,
        body: ListView(scrollDirection: Axis.vertical, children: [
          Column(
            children: [
              SizedBox(
                height: 30.0,
              ),
              Row(
                children: [
                  Container(
                    color: Colors.white24,
                    width: 360.0,
                    child: GestureDetector(
                      onTap: () {},
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            searcch = true;
                            text = value;
                          });
                        },
                        controller: searchtext,
                        decoration: InputDecoration(
                            hintText: 'search',
                            hintStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(Icons.search),
                            fillColor: Colors.black,
                            border: OutlineInputBorder()),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 1,
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CloudFirestoreSearch()));
                      },
                      icon: Icon(
                        Icons.search,
                        color: Colors.white24,
                        size: 32,
                      )),
                ],
              ),
              Divider(
                color: Colors.white,
                thickness: 0.7,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      width: 3.0,
                    ),
                    buttonsforsearch('IGTv', Icons.search),
                    SizedBox(
                      width: 3.0,
                    ),
                    buttonsforsearch('shop', Icons.shop),
                    SizedBox(
                      width: 3.0,
                    ),
                    buttonsforsearch('shop'),
                    SizedBox(
                      width: 3.0,
                    ),
                    buttonsforsearch('style'),
                    SizedBox(
                      width: 3.0,
                    ),
                    buttonsforsearch('sports'),
                  ],
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              // ignore: unnecessary_null_comparison

              searcch == false
                  ? SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: photolayoutarrangement())
                  : StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('bioUser')
                          .where('searchkeys', arrayContains: text)
                          .snapshots(),
                      builder: (context, snapshot) {
                        return (snapshot.connectionState ==
                                ConnectionState.waiting)
                            ? Center(child: CircularProgressIndicator())
                            : ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context, index) {
                                  DocumentSnapshot data =
                                      snapshot.data!.docs[index];
                                  // ignore: unnecessary_null_comparison
                                  return (name != "" && name != null)
                                      ? InkWell(
                                          onTap: () {
                                            debugPrint(data['uid']);

                                            debugPrint('poped');
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ShowTheProfileToAnotherUser(
                                                            uid: data['uid'])));
                                            //movetonextpage(data['uid']);
                                          },
                                          child: ListTile(
                                              leading: CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                    data['profileimag']),
                                              ),
                                              title: Text(
                                                data['name'],
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 20,
                                                ),
                                              )),
                                        )
                                      : Container();
                                });
                      })
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
              backgroundColor: Colors.green,
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
                Navigator.pushNamed(context, '/instahome');
              } else if (_currentIndex == 3) {
                Navigator.pushNamed(context, '/likes');
              } else {
                Navigator.pushNamed(context, '/profilepage');
              }
            });
          },
        ),
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
            bigphoto(3),
            hightphoto(2),
            bigphoto(1),
          ],
        ),
        Row(
          children: [
            bigphoto(1),
            hightphoto(3),
            bigphoto(2),
          ],
        ),
        Row(
          children: [
            bigphoto(2),
            hightphoto(0),
            bigphoto(1),
          ],
        ),
        Row(
          children: [
            bigphoto(1),
            hightphoto(3),
            bigphoto(2),
          ],
        ),
        Row(
          children: [
            bigphoto(0),
            hightphoto(2),
            bigphoto(3),
          ],
        ),
        Row(
          children: [bigphoto(0), hightphoto(2), bigphoto(0)],
        ),
        Row(
          children: [
            bigphoto(1),
            hightphoto(2),
            bigphoto(3),
          ],
        ),
        Row(
          children: [
            bigphoto(2),
            bigphoto(0),
            hightphoto(1),
          ],
        ),
      ],
    );
  }
}

GestureDetector hightphoto(int indexnumber) {
  return GestureDetector(
    child: Image(
      image: AssetImage(postimage[indexnumber]),
      width: 200,
      height: 100,
    ),
    onTap: () {},
  );
}

GestureDetector bigphoto(int indexnumber) {
  return GestureDetector(
    child: Image(
      image: AssetImage(postimage[indexnumber]),
      width: 203,
      height: 150,
    ),
    onTap: () {},
  );
}

// ignore: non_constant_identifier_names
Container buttonsforsearch(String Name, [IconData? iconsforbutton]) {
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
