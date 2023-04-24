
// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:instagrambasics/constants/post_json.dart';
import 'package:instagrambasics/nodyofinstapage/instabody.dart';

// ignore: must_be_immutable
// ignore: camel_case_types
// ignore: must_be_immutable
// ignore: camel_case_types
// ignore: must_be_immutable
class PostDart extends StatefulWidget {
  var index;

 PostDart({ Key? key, required this. index }) : super(key: key);

  @override
  _postDartState createState() => _postDartState();
}

// ignore: camel_case_types
class _postDartState extends State<PostDart> {
  @override
  Widget build(BuildContext context) {
   
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
                    image: NetworkImage(posts[widget.index]['profileImg']),
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              index == 0 ? posts[widget.index]['name'] : posts[widget.index]['name'],
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ]),
          IconButton(
            onPressed: () {
             
            },
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
                image: NetworkImage(posts[widget.index]['postImg']),
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
                  onPressed: () {
                    setState(() {
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
                  text: widget.index == 3
                      ? posts[0]['name']
                      : posts[widget.index]['name'],
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
                                text: posts[widget.index]['name'],
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                )),
                            TextSpan(
                              text: posts[widget.index]['caption'],
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

  }


  


