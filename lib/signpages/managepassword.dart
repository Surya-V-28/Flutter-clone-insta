



import 'package:flutter/material.dart';

class ManagePassword extends StatefulWidget {
  ManagePassword({Key? key}) : super(key: key);

  @override
  _ManagePasswordState createState() => _ManagePasswordState();
}

class _ManagePasswordState extends State<ManagePassword> {
  GlobalKey<FormState> _formkey =  GlobalKey<FormState>();
  var _oldpassword = TextEditingController();
  var _newpassword = TextEditingController();
  var _repeatpassword = TextEditingController();
  var newpassword ;
  bool checkCurrentPasswordValid = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Changge your password'),
         backgroundColor:   Colors.red,
         ),
         body: Form(
           key:  _formkey,
           child: Column(
         
             children: [
               TextFormField(
                 obscureText: true,
                 controller: _oldpassword,
                 decoration: InputDecoration(
                   labelText: 'Current Password',
                   border: OutlineInputBorder()
                   
                 ),
                 cursorColor: Colors.black,
               ),
               SizedBox(height: 20,),
               TextFormField(
                 obscureText: true,
                 controller: _newpassword,
                 decoration: InputDecoration(border: OutlineInputBorder(),
                 labelText: 'New ppassworrd'
                 ),
                 onChanged: (vlaueinnew) {
                        setState(() {
                           newpassword = vlaueinnew;
                        });
                 },
               ),
               SizedBox(height: 20.0,),
               TextFormField(
                 obscureText: true,
                 controller: _repeatpassword,
                 decoration: InputDecoration(labelText: 'repat passrord',
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(5.0)
                 )
                 ),
                   validator: (repeatpassword) {
                     // ignore: unnecessary_statements
                     return newpassword == repeatpassword? null: 'please enter the same password';
                   },
               ),
               SizedBox(height: 20.0,),
              
               Container(
                 width: 70.0,
                 height: 30.0,
                 child:
                  // ignore: deprecated_member_use
                  ElevatedButton(
                   
                    onPressed: () {
                    
                      if(_formkey.currentState!.validate()){
                      debugPrint('your are entered the right password');
                      }else{
                        debugPrint('not dalidate');
                      }
                     
                    },  child: Text('Save ')
                    
                    ))
             ],),
         ),
    );
  }
}

