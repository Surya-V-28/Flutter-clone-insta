import 'package:flutter/material.dart';

class PageVeiwForImage extends StatefulWidget {
  PageVeiwForImage({Key? key}) : super(key: key);

  @override
  _PageVeiwForImageState createState() => _PageVeiwForImageState();
}

class _PageVeiwForImageState extends State<PageVeiwForImage> {
  @override
  Widget build(BuildContext context) {
    return  PageView(
        children: [
          pageCrerator('4', Colors.red),
          pageCrerator('5', Colors.blue),
          pageCrerator('6', Colors.green),
          pageCrerator('7', Colors.yellow),
          pageCrerator('8', Colors.orange),
        ],
    );
  }
}

Widget pageCrerator(String index, Color color) {
  return Container(
    width: 400.0,
    height: 400.0,
    child: Center(
      child: Text(
        '$index',
        style: TextStyle(
          fontSize: 100.0,
        ),
      ),
    ),
    color: color,
  );
}
