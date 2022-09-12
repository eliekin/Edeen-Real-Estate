import 'package:flutter/material.dart';
import 'package:myproprety/screens/login_screen.dart';
import 'package:myproprety/screens/registration_screen.dart';
import '../widgets/button.dart';

class WelcomeScreen extends StatefulWidget {
  static const routeName = 'WelcomeScreen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    animation =
        ColorTween(begin: Colors.cyan, end: Colors.white).animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text('Edden Real Estate')
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            Button(
              function: () =>
                  Navigator.of(context).pushNamed(LoginScreen.routeName),
              Name: 'Login',
              color: Colors.blue,
            ),
            Button(
                Name: 'Create an account',
                color: Colors.blueAccent,
                function: () {
                  Navigator.of(context).pushNamed(RegistrationScreen.routeName);
                })
          ],
        ),
      ),
    );
  }
}
