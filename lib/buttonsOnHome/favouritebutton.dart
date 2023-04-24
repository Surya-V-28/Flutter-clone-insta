import 'package:flutter/material.dart';
import 'package:instagrambasics/constants/post_json.dart';

int  _currentIndex = 3;
class FavouriteButton extends StatefulWidget {
  FavouriteButton({Key? key}) : super(key: key);

  @override
  _FavouriteButtonState createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  var indexnumber;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            bottom: TabBar(
              indicatorWeight: 8.0,
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  text: 'you',
                ),
                Tab(
                  text: 'following',
                ),
                
              ],
            ),
          ),
          body: TabBarView(
            children: [
               _functionOflikesTabBar('you', 0),
              _functionOfTabBar('following'),
             
            ],
          ),
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
                backgroundImage:AssetImage(circularimage[7])),
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
      ),
    );
  }
}

ListView _functionOfTabBar(String s) {
  return ListView(
    children: [
      Center(child: Text(s + ' hello')),
      Text(s + ' hello'),
      Text(s + ' hello'),
      Text(s + ' hello'),
      Center(child: Text(s + ' hello')),
      Text(s + ' hello'),
      Text(s + ' hello'),
      Text(s + ' hello'),
      Text(s + ' hello'),
      Text(s + ' hello'),
      Text(s + ' hello'),
      Text(s + ' hello'),
      Text(s + ' hello'),
      Center(child: Text(s + ' hello')),
      Text(s + ' hello'),
      Text(s + ' hello'),
      Text(s + ' hello'),
      Text(s + ' hello'),
      Center(child: Text(s + ' hello')),
      Text(s + ' hello'),
    ],
  );
}

ListView _functionOflikesTabBar(String s, int indexnumber) {
  return ListView(
    children: [
      ListTile(
        title: Text(
          'Follow request',
          style: TextStyle(color: Colors.white),
        ),
      ),
      Divider(
        height: 1.7,
        color: Colors.white,
        thickness: 0.1,
      ),
      ListTile(
        title: Text(
          'New',
          style: TextStyle(color: Colors.white),
        ),
      ),
      ListTile(
        subtitle: Text(
          '2h ago',
          style: TextStyle(
            color: Colors.white.withOpacity(0.4),
          ),
        ),
        title: Text(
          posts[indexnumber]['name'] + " liked your photo ",
          style: TextStyle(color: Colors.white),
        ),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(posts[indexnumber]['profileImg']),
        ),
        trailing: Container(
          child: Image(
            image: AssetImage('assets/user3.jpg'),
          ),
        ),
      ),
      Divider(
        height: 1.7,
        color: Colors.white,
        thickness: 0.4,
      ),
      ListTile(
        title: Text(
          'Today',
          style: TextStyle(color: Colors.white),
        ),
      ),
      ListTile(
        minLeadingWidth: 10,
        leading: Container(
          width: 65,
          height: 65,
          child: Stack(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        colors: [Colors.blue, Colors.red])),
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(posts[1]['profileImg']),
                          fit: BoxFit.cover)),
                ),
              ),
              Positioned(
                top: 15,
                left: 25,
                child: Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient:
                          LinearGradient(colors: [Colors.white, Colors.red])),
                  child: Container(
                    width: 37,
                    height: 37,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(posts[2]['profileImg']),
                            fit: BoxFit.cover)),
                  ),
                ),
              )
            ],
          ),
        ),
        subtitle: Text(
          '4h ago',
          style: TextStyle(
            color: Colors.white.withOpacity(0.4),
          ),
        ),
        title: Text(
          posts[indexnumber]['name'] + ' and others liked you photos',
          style: TextStyle(color: Colors.white),
        ),
        trailing: Container(
          child: Image(
            image: AssetImage(postimage[1]),
          ),
        ),
      ),
      Divider(
        height: 1.7,
        color: Colors.white,
        thickness: 0.1,
      ),
      ListTile(
        title: Text(
          'this Week',
          style: TextStyle(color: Colors.white),
        ),
      ),
      ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.red,
          backgroundImage: NetworkImage(posts[indexnumber + 3]['profileImg']),
        ),
        title: Text(
          'mention you in the comment @helloo,what excalty...',
          style: TextStyle(color: Colors.white),
        ),
        trailing: Container(
          child: Image(
            image: AssetImage(postimage[5]),
          ),
        ),
        subtitle: Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite,
                  color: Colors.white.withOpacity(0.4),
                )),
            SizedBox(
              width: 1.0,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  'Reply',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.4),
                  ),
                ))
          ],
        )),
      ),
      ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(postimage[4]),
        ),
        title: Text(
          ' martini_ rod Started following you',
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          '3d',
          style: TextStyle(color: Colors.white.withOpacity(0.4)),
        ),
        trailing:
            // ignore: deprecated_member_use
            Container(
          width: 93,
          height: 55,
          color: Colors.white,
          child: Container(
            width: 80,
            height: 40,
            color: Colors.black,
            child: OutlinedButton(
              onPressed: () {},
              child: Text(
                'message',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
      ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(postimage[5]),
        ),
        title: Text(
          ' maxjackson job Started following you',
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          '4d',
          style: TextStyle(color: Colors.white.withOpacity(0.4)),
        ),
        trailing:
            // ignore: deprecated_member_use
            Container(
          width: 93,
          height: 55,
          color: Colors.white,
          child: Container(
            width: 80,
            height: 40,
            color: Colors.black,
            child: OutlinedButton(
              onPressed: () {},
              child: Text(
                'message',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
      ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(postimage[6]),
        ),
        title: Text(
          '  mis_potter Started following you',
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          '5d',
          style: TextStyle(color: Colors.white.withOpacity(0.4)),
        ),
        trailing:
        // ignore: deprecated_member_use
            ElevatedButton(
          onPressed: () {},
          child: Text(
            'Follow',
            style: TextStyle(color: Colors.black),
          ),
          style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          )
        ),
      ),
      Divider(
        height: 1.7,
        color: Colors.white,
        thickness: 0.1,
      ),
      ListTile(
        title: Text(
          'This Month',
          style: TextStyle(color: Colors.white),
        ),
      ),
       ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(postimage[7]),
        ),
        title: Text(
          ' mr_humpyrey_2 Started following you',
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          '4d',
          style: TextStyle(color: Colors.white.withOpacity(0.4)),
        ),
        trailing:
            // ignore: deprecated_member_use
            Container(
          width: 93,
          height: 55,
          color: Colors.white,
          child: Container(
            width: 80,
            height: 40,
            color: Colors.black,
            child: OutlinedButton(
              onPressed: () {},
              child: Text(
                'message',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
        ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(postimage[7]),
        ),
        title: Text(
          ' martin Started following you',
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          '4d',
          style: TextStyle(color: Colors.white.withOpacity(0.4)),
        ),
        trailing:
            // ignore: deprecated_member_use
            Container(
          width: 93,
          height: 55,
          color: Colors.white,
          child: Container(
            width: 80,
            height: 40,
            color: Colors.black,
            child: OutlinedButton(
              onPressed: () {},
              child: Text(
                'message',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    
    ],

  );
}
