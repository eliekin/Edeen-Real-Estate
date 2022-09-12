import 'package:flutter/material.dart';
import 'package:myproprety/screens/home_screen.dart';
import 'package:myproprety/widgets/button.dart';
import '../widgets/inputText.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = 'LoginScreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _authUser = FirebaseAuth.instance;
  late String userEmail;
  late String userPassword;

  bool spinnerLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
                child: Container(
                    height: 200.0,
                    child: Hero(
                        tag: 'logo', child: Image.asset('images/logo.png')),),),
            SizedBox(
              height: 5.0,
            ),
            TextField(
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  userEmail = value;
                },
                decoration: InputText('Enter Your Email'),),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              style: TextStyle(color: Colors.black),
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                userPassword = value;
              },
              decoration: InputText('Enter Your Password'),
            ),
            SizedBox(
              height: 24.0,
            ),
            Button(
                Name: 'Register',
                color: Colors.lightBlueAccent,
                function: () async {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: ((context) => HomeScreen()),),);
                }),
          ],
        ),
      ),
    );
  }
}
