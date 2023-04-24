import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:instagrambasics/buttonsOnHome/addpost/pasteimagehometile.dart';
// ignore: unused_import
import 'package:instagrambasics/buttonsOnHome/addpost/post.dart';
// ignore: unused_import
import 'package:instagrambasics/constants/post_json.dart';
// ignore: unused_import
import 'package:instagrambasics/nodyofinstapage/posttile.dart/posttile.dart';
import 'package:transparent_image/transparent_image.dart';
import 'fullstoryfunction.dart';

var name = '';
String pressedtext = '';
Color favchange = Colors.white;
int index = 1;
int value = 0;
int indexforpost = 1;

//golbal variable
// ignore: must_be_immutable
class InstabodyVeiw extends StatefulWidget {
  InstabodyVeiw({
    Key? key,
  }) : super(key: key);
  @override
  _InstabodyVeiwState createState() => _InstabodyVeiwState();
}

class _InstabodyVeiwState extends State<InstabodyVeiw> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          StroyScrollable(),
          Divider(
            color: Colors.white.withOpacity(0.4),
          ),
          SizedBox(
            height: 5.0,
          ),
          // PhotoWithImage(),
          SizedBox(
            height: 5.0,
          ),
          Column(children: [
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('imageurls')
                  .snapshots(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                List<DocumentSnapshot>? file = snapshot.data.docs;
                debugPrint('$file');

                return !snapshot.hasData
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Container(
                        padding: EdgeInsets.all(4),
                        child: ListView.builder(
                          itemCount: file!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: EdgeInsets.all(3),
                              child: FadeInImage.memoryNetwork(
                                  fit: BoxFit.cover,
                                  placeholder: kTransparentImage,
                                  image: file[index].get('url')),
                            );
                          },
                        ),
                      );
              },
            ),
            //  GetallthepostformDatabase()
          ]),
        ],
      ),
    );
  }

  ListTile liked(BuildContext context) {
    return ListTile(
      title: Text(
        'like',
        style: TextStyle(color: Colors.white),
      ),
      onTap: () {
        _selectedstuff(
          'you liked the post',
        );
        SnackBar myshack = SnackBar(
          content: Text('$pressedtext'),
        );
        // ignore: deprecated_member_use
        ScaffoldMessenger.of(context).showSnackBar(myshack);
      },
    );
  }

  void _selectedstuff(String name) {
    Navigator.pop(context);
    setState(() {
      pressedtext = name;
    });
  }

  void function() {
    showBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 290.0,
            color: Colors.black,
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0))),
                child: buttonsheet(context)),
          );
        });
  }

  Column buttonsheet(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            'copy Link',
            style: TextStyle(color: Colors.white),
          ),
          onTap: () {
            _selectedstuff('copied');
            SnackBar myshack = SnackBar(
              content: Text('$pressedtext'),
            );
            // ignore: deprecated_member_use
            ScaffoldMessenger.of(context).showSnackBar(myshack);
          },
        ),
        ListTile(
          title: Text(
            'save',
            style: TextStyle(color: Colors.white),
          ),
          onTap: () {
            _selectedstuff('saved');
            SnackBar myshack = SnackBar(
              content: Text('$pressedtext'),
            );
            // ignore: deprecated_member_use
            ScaffoldMessenger.of(context).showSnackBar(myshack);
          },
        ),
        ListTile(
          title: Text(
            'share',
            style: TextStyle(color: Colors.white),
          ),
          onTap: () {
            _selectedstuff(
              'shared',
            );
            SnackBar myshack = SnackBar(
              content: Text('$pressedtext'),
            );
            // ignore: deprecated_member_use
            ScaffoldMessenger.of(context).showSnackBar(myshack);
          },
        ),
        liked(context),
        ListTile(
          title: Text(
            'back',
            style: TextStyle(color: Colors.white),
          ),
          onTap: () {
            _selectedstuff(
              '',
            );
          },
        ),
      ],
    );
  }

// ignore: must_be_immutable
// ignore: non_constant_identifier_names
  int Indexchager(index) {
    index = index + 1;
    return index;
  }
}

