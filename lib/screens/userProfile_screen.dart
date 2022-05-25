import 'package:flutter/material.dart';

class userProfileScreen extends StatefulWidget {

  @override
  State<userProfileScreen> createState() => _userProfileScreenState();
}

class _userProfileScreenState extends State<userProfileScreen> {
  @override
  Widget build(BuildContext context) {

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
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back_ios_new),
                ),
              ],
            ),
            Stack(children: [
              Container(
                margin: EdgeInsets.only(top: 30),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue.withOpacity(
                    0.2,
                  ),
                ),
                child: Image.asset('images/logo.png',
                    width: 50,
                    height: 50,
                    color: Colors.white.withOpacity(0.3),
                    colorBlendMode: BlendMode.modulate),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 70),
                child: Center(
                  child: Column(
                    children: [
                      Icon(
                        Icons.camera_alt,
                        color: Colors.blue,
                        size: 60,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Set a profil picture',
                        style: TextStyle(color: Colors.blue, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: TextStyle(
                  color: Colors.blue,
                ),
              ),
              onFieldSubmitted: (_){
                return FocusScope.of(context).requestFocus(_phoneFocusNode);
              },
              textInputAction: TextInputAction.newline,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Phone Number',
                labelStyle: TextStyle(
                  color: Colors.blue,
                ),
              ),
              focusNode: _phoneFocusNode,
                onFieldSubmitted: (_){
                return FocusScope.of(context).requestFocus(_emailFocusNode);
              },
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.newline,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email Address',
                labelStyle: TextStyle(
                  color: Colors.blue,
                ),
              ),
              focusNode: _emailFocusNode,
              textInputAction: TextInputAction.newline,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          
            Container(
              padding: EdgeInsets.only(top: 30),
              child: ElevatedButton(
  onPressed: () {
    
  },
  child: const Text('Submit'),
),
            ),
          ]),
        ),
      ),
    );
  }
}
