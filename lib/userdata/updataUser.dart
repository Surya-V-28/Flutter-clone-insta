import 'package:flutter/material.dart';

import 'package:instagrambasics/userdata/locator.dart';


// ignore: must_be_immutable
class UpDataUserData extends StatefulWidget {
  UpDataUserData({Key? key, required this.db, required this.person})
      : super(key: key);
  Map person;
  DataUser db;
  @override
  _UpDataUserDataState createState() => _UpDataUserDataState();
}

class _UpDataUserDataState extends State<UpDataUserData> {
  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  void initState() {
    super.initState();
    print(widget.person);
    nameController.text = widget.person['name'];
    bioController.text = widget.person['bio'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("edit page"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    controller: bioController,
                    decoration: InputDecoration(
                      labelText: "biographhy",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ],
              ),
              // ignore: deprecated_member_use
              ElevatedButton(
                onPressed: () {
                  widget.db.updataUser(widget.person['id'], nameController.text,
                      bioController.text);

                  Navigator.pop(context, true);
                },
                child: Text('save '),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
