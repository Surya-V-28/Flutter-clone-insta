


import 'package:flutter/material.dart';

// ignore: camel_case_types
class bottomnavigationclass  {

     Widget commonFiveIndexNavigation(int _currentIndex,BuildContext context) {
      return BottomNavigationBar(
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
        );
     }
}