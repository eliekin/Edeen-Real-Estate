import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:myproprety/screens/home_screen.dart';
import '../widgets/inputText.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegistrationScreen extends StatefulWidget {
  static const routeName = 'RegistrationScreen';

  const RegistrationScreen({Key? key}) : super(key: key);
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();
  final _authUser = FirebaseAuth.instance;
  TextEditingController userName = TextEditingController();
  TextEditingController userPhoneNumber = TextEditingController();
  bool _isLoanding = false;
  final GlobalKey<FormState> _signUpKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    userEmail.dispose();
    userPassword.dispose();
    userName.dispose();
    userPhoneNumber.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoanding
        ? Container(
            color: Colors.orange[300],
            child: Center(
              child: LoadingAnimationWidget.discreteCircle(
                  color: Colors.white, size: 50),
            ),
          )
        : Scaffold(
            // resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            body: Column(
              children: [
                Flexible(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 4,
                    decoration: const BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(top: 100.0, left: 60),
                      child: Text(
                        'Hey, get on board!',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Stack(children: [
                  Container(
                    child: const Padding(
                      padding: EdgeInsets.only(top: 100.0, left: 60),
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 10,
                    decoration: const BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(60),
                        bottomRight: Radius.circular(60),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 30, right: 25, top: 0),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 1.7,
                    child: Expanded(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 5.5,
                        child: Form(
                          key: _signUpKey,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                SizedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          left: 20, right: 20, top: 30),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.black26.withOpacity(0.1),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: TextFormField(
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'NAME is missing ';
                                            }
                                            return null;
                                          },
                                          decoration: const InputDecoration(
                                            contentPadding: EdgeInsets.all(8),
                                            border: InputBorder.none,
                                            hintText: 'NAME',
                                            hintStyle:
                                                TextStyle(color: Colors.white),
                                            icon: Icon(
                                                Icons.person_outline_rounded),
                                          ),
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          style: const TextStyle(
                                              color: Colors.black),
                                          onChanged: (value) {
                                            userName.text = value;
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                textFieldFrom(
                                    'EMAIL', userEmail, Icons.email_rounded),
                                textFieldFrom('PHONE NUMBER', userPhoneNumber,
                                    Icons.phone_in_talk_rounded),
                                textFieldFrom('PASSWORD', userPassword,
                                    Icons.lock_outline_rounded),
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 80.0),
                                  child: ElevatedButton.icon(
                                    onPressed: () async {
                                      setState(() {
                                        _isLoanding = true;
                                      });
                                      try {
                                        if (_signUpKey.currentState!
                                            .validate()) {
                                          final newUser = await _authUser
                                              .createUserWithEmailAndPassword(
                                                  email: userEmail.text,
                                                  password: userPassword.text);
                                          await FirebaseFirestore.instance
                                              .collection('users')
                                              .doc(newUser.user!.uid)
                                              .set({
                                            'name': userName,
                                            'phoneNumber': userPhoneNumber,
                                            'email': userEmail
                                          });
                                          setState(() {
                                            _isLoanding = false;
                                          });
                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const HomeScreen(),
                                            ),
                                          );
                                        }
                                      } catch (e) {
                                        setState(() {
                                          _isLoanding = false;
                                        });
                                        // var e =
                                        //     'Please enter valid informations or maybe try later';
                                        // ScaffoldMessenger.of(context)
                                        //     .showSnackBar(
                                        //   SnackBar(
                                        //     backgroundColor: Colors.white,
                                        //     content: Text(
                                        //       e,
                                        //       textAlign: TextAlign.center,
                                        //       style: const TextStyle(
                                        //           color: Colors.red),
                                        //     ),
                                        //   ),
                                        // );
                                      }
                                    },
                                    icon: const Icon(
                                        Icons.arrow_circle_right_rounded),
                                    label: const Text('Sign Up'),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ),
                ]),
              ],
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
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(8),
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: const TextStyle(color: Colors.white),
                icon: Icon(icon),
              ),
              obscureText: true,
              onChanged: (value) {
                userInput.text = value;
              },
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(color: Colors.black),
              validator: (value) {
                if (value!.isEmpty) {
                  return '$hintText is missing';
                }
                return null;
              },
            ),
          ),
        ),
      ),
    );
  }

  SizedBox sizedBox() {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 40,
    );
  }
}
