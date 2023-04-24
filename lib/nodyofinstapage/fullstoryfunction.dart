


// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagrambasics/constants/post_json.dart';

class StroyScrollable extends StatelessWidget {
  const StroyScrollable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: List.generate(stories.length, (index) {
        return StoryItem(
          inde: stories[index]['name'],
        );
      })),
    );
  }
}


class StoryItem extends StatelessWidget {
  final String inde;
  const StoryItem({
    Key? key, required this.inde, photo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0,bottom:10.0),
      child: Column(
            children: [
      Container(
        width: 65,
        height: 65,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blue,
          ),
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage('assets/user4.jpg'),
            fit: BoxFit.cover,
            )
        ),
      ),
      SizedBox(height: 8,),
      SizedBox(
        width: 70.0,
        child: Text(inde,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: Colors.white
        ),
        ),
      )
            ],
          ),
    );
  }
}
// images upload by  the user where we can show the profile photo and some thing
// ignore: non_constant_identifier_names
Widget uploadPhotoWithProfile(String url, String name, String Themesofauthor) {
  return Container(
    color: Colors.black87,
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(1.0),
          
          child: CircleAvatar(
            backgroundImage: AssetImage('$url'),
            radius: 30.0,
          ),
        ),
        Expanded(
          child: Text(
            '$name',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        Expanded(
          child: Text(
            '$Themesofauthor',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ],
    ),
  );
}
