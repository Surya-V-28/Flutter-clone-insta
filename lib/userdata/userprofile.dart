import 'package:flutter/material.dart';
import 'package:instagrambasics/userdata/locator.dart';

import 'package:instagrambasics/userdata/newUser.dart';
import 'package:instagrambasics/userdata/updataUser.dart';

class UserProfileShowWithDataBase extends StatefulWidget {
  UserProfileShowWithDataBase({Key? key}) : super(key: key);

  @override
  _UserProfileShowWithDataBaseState createState() =>
      _UserProfileShowWithDataBaseState();
}

class _UserProfileShowWithDataBaseState
    extends State<UserProfileShowWithDataBase> {
  int indexnumber = 0;
  String names = "";
  List docInProfilePage = [];
  DataUser? db;
  initialiase() {
    db = DataUser();
    db!.initiliase();
    db!.read().then((value) => {
          setState(() {
            docInProfilePage = value!;
          })
        });
  }

  var indexofnumber = 0;
  @override
  void initState() {
    super.initState();
    initialiase();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('read the dat from firebase '),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: docInProfilePage.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UpDataUserData(
                              person: docInProfilePage[index],
                              db: db!))).then((value) => {
                        if (value != null) {initialiase()}
                      });
                },
                tileColor: Colors.green,
                title: Text(docInProfilePage[index]['name']),
                subtitle: Text(docInProfilePage[index]['more']),
              ),
            );
          }),
          floatingActionButton: FloatingActionButton(backgroundColor:
          Colors.blue,
          child: Icon(Icons.add),
          tooltip: 'add notes'
           , onPressed: () { 
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>NewUserData(db:db!))).then((value){
                    if(value!=null){
                      initialiase();
                    }
                  });
            },),
    );
  }
} 
