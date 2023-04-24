import 'package:flutter/material.dart';

import 'package:instagrambasics/userdata/locator.dart';

// ignore: must_be_immutable
class NewUserData extends StatefulWidget {
  NewUserData({Key? key,required this.db}) : super(key: key);

  DataUser db;
  @override
  _NewUserDataState createState() => _NewUserDataState();
}

class _NewUserDataState extends State<NewUserData> {
  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController moreController = TextEditingController();
  
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("edit page"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 40,
                ),
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
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  controller: moreController,
                  decoration: InputDecoration(
                    labelText: "more",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ) 
                ),
              ],
            ),
            // ignore: deprecated_member_use
            ElevatedButton(
              onPressed: () {
                widget.db
                    .createFunction(nameController.text, bioController.text,moreController.text);
                Navigator.pop(context, true);
              },
              child: Text('save '),
            ),
          ],
        ),
      ),
    );
  }
}
