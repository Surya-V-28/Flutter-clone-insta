





import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagrambasics/buttonsOnHome/addpost/pastetheimageinhome.dart';
// ignore: unused_import
import 'package:instagrambasics/buttonsOnHome/addpost/databasehelp.dart';
import 'package:instagrambasics/buttonsOnHome/addpost/pasteimagehometile.dart';
import 'package:instagrambasics/buttonsOnHome/profile/editprofileuser.dart';
import 'package:instagrambasics/chatbot/showallchatinmessage.dart';
// ignore: unused_import

import 'package:instagrambasics/signpages/futurebuilder.dart';
import 'package:instagrambasics/signpages/loginpage.dart';
import 'package:instagrambasics/signpages/verfiyemail.dart';
// ignore: unused_import
import 'buttonsOnHome/addpost/checker.dart';
import 'buttonsOnHome/addpost/imageget.dart';
import 'buttonsOnHome/addpost/post.dart';
import 'buttonsOnHome/profile/showusertoanother.dart';
// ignore: unused_import
import 'chatbot/dmessage.dart';
import 'buttonsOnHome/favouritebutton.dart';
import 'buttonsOnHome/profile/backend/setupusername.dart';
import 'buttonsOnHome/profile/profilepage.dart';
import 'buttonsOnHome/search/secondtime.dart';
import 'buttonsOnHome/searchbutton.dart';
import 'constants/post_json.dart';
import 'signpages/forgotten.dart';
// ignore: unused_import
// ignore: unused_import
import 'nodyofinstapage/instabody.dart';
// ignore: unused_import
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'signpages/managepassword.dart';
import 'signpages/singin.dart';
import 'signpages/pagetochose.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp( GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/Firebase',
    routes: {
      '/signup': (context) => SignInPage(),
      '/instahome': (context) => Homepage(),
      '/fritpage': (context) => ChoseinggPage(),
      '/loginpage': (context) => LoginPage(),
      '/search': (context) => SearchPage(),
      '/likes': (context) => FavouriteButton(),
      '/message': (context) => Showalluserschat(),
      '/profilepage': (context) => ProfilePage(),
      '/Firebase': (context) => FutureWidgets(),
      '/verfiypage': (context) => VerfiyEmail(),
      '/changeppass': (context) => ManagePassword(),
      '/resetpass': (context) => ResetScreen(),
      '/editprofile': (context) => EditProfileForUser(),
      '/uploadimage': (context) => PostPageforCreating(
            image: '',
            uid: '',
            path: '',
          ),
      '/imagegetter': (context) => ImageGetter(),
      '/searchbackend': (context) => CloudFirestoreSearch(),
      '/postsetterinmain': (context) => PastePostTile(
            index: 0, dataoflist: '',
          ),
      '/setusername': (context) => ChnageUserName(),
      '/checker': (context) =>  Checkerforthepostedimages(),
      '/twochecker': (context) =>  Pastetheimages(),
      'showanotheruser' : (context) => ShowTheProfileToAnotherUser(uid: '',)
    },
  ));
}

int _currentIndex = 0;
List docPostPage = [];

// ignore: must_be_immutable
class Homepage extends StatefulWidget {
  Homepage({
    Key? key,
  }) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var picker = ImagePicker();
  var path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
            shadowColor: Colors.black87,
            centerTitle: true,
            title: Image(
              image: AssetImage('assets/instagramnamme.jpg'),
              width: 80,
            ),
            backgroundColor: Colors.black87,
            leading: GestureDetector(
              child: Container(
                  height: 20.0,
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    child: Image(
                      image: AssetImage('assets/user1.png'),
                      height: 25.0,
                    ),
                  )),
              onTap: () {
                setState(() {
                  
                });
              },
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.messenger_outline_outlined),
                onPressed: () {
                  debugPrint('live started');
                  setState(() {
                    
                  });
                },
              ),
              IconButton(
                icon: Image(
                  image: AssetImage('assets/message.png'),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/message');
                  debugPrint('moving to notification');
                },
              ),
            ]),
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Divider(
            color: Colors.black26,
            thickness: 5.0,
          ),
         
          Flexible(child:Pastetheimages()),
        ]),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(  
              icon: Icon(Icons.home),
              // ignore: deprecated_member_use
              label: '',
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
                  backgroundImage: NetworkImage(
                    posts[2]['profileImg'],
                  )),
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
        ));
  }
}
