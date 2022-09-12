import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myproprety/screens/uerProfilScreen.dart';
// import 'package:myproprety/widgets/inputText.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class UserProfileScreenForm extends StatefulWidget {
  @override
  State<UserProfileScreenForm> createState() => _UserProfileScreenFormState();
}

class _UserProfileScreenFormState extends State<UserProfileScreenForm> {
  TextEditingController userEmail = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController userPassword = TextEditingController();
  TextEditingController userPhoneNumber = TextEditingController();
  final _authUser = FirebaseAuth.instance;
  final GlobalKey<FormState> _user = GlobalKey<FormState>();

  bool spinnerLoading = false;
  var pickedImage;

  void _pickImage() async {
    var pickedImageFile = await ImagePicker().pickImage(
        imageQuality: 100,
        source: ImageSource.gallery,
        maxHeight: MediaQuery.of(context).size.height / 3,
        maxWidth: MediaQuery.of(context).size.width);
    // SharedPreferences saveImage = await SharedPreferences.getInstance();
    // saveImage.setString('imagepath', pickedImageFile!.path);

    setState(() {
      pickedImage = File(pickedImageFile!.path);
    });
  }

  @override
  void dispose() {
    super.dispose();
    userEmail.dispose();
    userName.dispose();
    userPassword.dispose();
    userPhoneNumber.dispose();
  }

  bool showAnimation = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      showAnimation = true;
    });
  }

  var user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return user != null
        ? UserProfilScreen()
        : SafeArea(
            child: Scaffold(
              appBar:AppBar(
                automaticallyImplyLeading: false,
                elevation: 2.0,
                title:const Text('Sign Up'),
                centerTitle:true,
              ),
              body: SingleChildScrollView(
                child: Stack(children: [
                  Positioned(
                    // duration:const Duration(milliseconds: 0),

                    child: Container(
                      margin:
                          const EdgeInsets.only(top: 10, right: 20, left: 20),
                      width: double.infinity,
                      height: 100,
                      decoration: const BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100),
                          bottomLeft: Radius.circular(100),
                          topRight: Radius.circular(100),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Happy having you back,',
                            style: TextStyle(
                                color: Colors.cyan,
                                fontSize: 20,
                                fontWeight: FontWeight.w800),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30.0),
                            child: Text(
                              'Sign up for a better experience!',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.only(top: 130, left: 20, right: 20, bottom: 10),
                        decoration: const BoxDecoration(color: Colors.cyan, borderRadius:  BorderRadius.only(
                          bottomRight:  Radius.circular(100),
                          bottomLeft: Radius.circular(100),
                          topRight: Radius.circular(100),
                        ),),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Form(
                        key: _user,
                        child: Column(children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 2, color: Colors.cyan),
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.black12),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.folder_rounded,
                                    size: 50,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Pick a profil picture',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          textFieldFrom(
                              'NAME', userName, Icons.person_outline_rounded),
                          textFieldFrom(
                              'EMAIL', userEmail, Icons.mail_outline_rounded),
                          textFieldFrom('PHONE NUMBER', userPhoneNumber,
                              Icons.phone_in_talk_rounded),
                          textFieldFrom(
                              'PASSWORD', userPassword, Icons.lock_rounded),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20.0, right: 30, left: 30, bottom: 10),
                            child: Material(
                              color: Colors.blueGrey,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                              elevation: 5.0,
                              child: MaterialButton(
                                onPressed: () async {
                                  try {
                                    if (_user.currentState!.validate()) {
                                      final newUser = await _authUser
                                          .createUserWithEmailAndPassword(
                                              email: userEmail.text,
                                              password: userPassword.text);

                                      await FirebaseFirestore.instance
                                          .collection('users')
                                          .doc(newUser.user!.uid)
                                          .set({
                                        'name': userName.text,
                                        'phoneNumber': userPhoneNumber.text,
                                        'email': userEmail.text
                                      });
                                    }
                                  } catch (e) {
                                    // print(e);
                                    debugPrint(e.toString());
                                  }
                                },
                                minWidth: 150.0,
                                height: 42.0,
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          );
  }

  SizedBox textFieldFrom(
      String hintText, TextEditingController userInput, IconData icon) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(top: 0.0),
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black26.withOpacity(0.1),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '$hintText IS MISSING';
                }
                return null;
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(8),
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: const TextStyle(color: Colors.white),
                icon: Icon(icon),
              ),
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(color: Colors.black),
              onChanged: (value) {
                userInput.text = value;
              },
            ),
          ),
        ),
      ),
    );
  }
}
