// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget profileListteiw(String url, String username, String lociation) {
  return ListTile(
      leading: Padding(
        padding: const EdgeInsets.only(left: 4.0),
        child: CircleAvatar(
          backgroundColor: Colors.blue,
          backgroundImage: AssetImage('$url'),
          radius: 30.0,
        ),
      ),
      title: Text('$username'),
      subtitle: Text('$lociation'),
      onTap: () {},
  );
}
