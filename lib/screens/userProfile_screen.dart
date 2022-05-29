import 'package:flutter/material.dart';

import '../widgets/TextFormField.dart';
import '../widgets/imagePickerBox.dart';

class UserProfileScreen extends StatefulWidget {

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var navigator = Navigator.of(context);

  final _phoneFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();

  @override
  void dispose(){
    _phoneFocusNode.dispose();
    _emailFocusNode.dispose();

    super.dispose();
  }
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Form(
          child: ListView(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    navigator.pop();
                  },
                  icon: Icon(Icons.arrow_back_ios_new),
                ),
              ],
            ),
           PickerImageBox(),
            TextFormFieldWidget('Name', _phoneFocusNode),
            TextFormFieldWidget('Email Address',_emailFocusNode),
            TextFormFieldWidget('Phone Number',_emailFocusNode),
          
            Container(
              padding: EdgeInsets.only(top: 30),
              child: ElevatedButton(
      onPressed: () { },
      child: const Text('Submit'),
      ),
            ),
          ]),
        ),
      ),
    );
  }  

  }

