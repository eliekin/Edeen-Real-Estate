import 'package:flutter/material.dart';
import 'package:myproprety/screens/home_screen.dart';
import 'package:myproprety/screens/registration_screen.dart';
// import '../widgets/inputText.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = 'LoginScreen';

  const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String userEmail;
  late String userPassword;
  bool _isLoanding = false;
  final GlobalKey<FormState> _login = GlobalKey<FormState>();

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
            resizeToAvoidBottomInset: false,
            body: Column(
              children: [
                Stack(children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 760),
                    decoration: const BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(60),
                        bottomLeft: Radius.circular(60),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2.5,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 50.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Hello,',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Welcome Back',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.white70),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 10,
                  ),
                  Container(
                    margin:
                        const EdgeInsets.only(left: 30, right: 25, top: 200),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2,
                    child: Expanded(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 5.5,
                        child: Form(
                          key: _login,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 0.0),
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        left: 20, right: 20, top: 60),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.black26.withOpacity(0.1),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return '$userEmail is missing';
                                          }
                                          return null;
                                        },
                                        decoration: const InputDecoration(
                                          contentPadding: EdgeInsets.all(8),
                                          border: InputBorder.none,
                                          hintText: 'EMAIL',
                                          hintStyle:
                                              TextStyle(color: Colors.white),
                                          icon:
                                              Icon(Icons.mail_outline_rounded),
                                        ),
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        style: const TextStyle(
                                            color: Colors.black),
                                        onChanged: (value) {
                                          userEmail = value;
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 0.0),
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        left: 20, right: 20, top: 20),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.black26.withOpacity(0.1),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return '$userPassword is missing';
                                          }
                                          return null;
                                        },
                                        decoration: const InputDecoration(
                                          contentPadding: EdgeInsets.all(8),
                                          border: InputBorder.none,
                                          hintText: 'PASSWORD',
                                          hintStyle:
                                              TextStyle(color: Colors.white),
                                          icon:
                                              Icon(Icons.lock_outline_rounded),
                                        ),
                                        obscureText: true,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        style: const TextStyle(
                                            color: Colors.black),
                                        onChanged: (value) {
                                          userPassword = value;
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 80.0),
                                child: ElevatedButton.icon(
                                    onPressed: () async {
                                      try {
                                        if (_login.currentState!.validate()) {
                                          setState(() {
                                            _isLoanding = true;
                                          });
                                          await FirebaseAuth.instance
                                              .signInWithEmailAndPassword(
                                                  email: userEmail,
                                                  password: userPassword);
                                          setState(() {
                                            _isLoanding = false;
                                          });
                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                              builder: ((context) =>
                                                  const HomeScreen()),
                                            ),
                                          );
                                        }
                                      } catch (e) {
                                        debugPrint(e.toString());
                                      }
                                    },
                                    icon: const Icon(
                                        Icons.arrow_circle_right_rounded),
                                    label: const Text('Login')),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Don't have an account ? ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: ((context) =>
                                                  const RegistrationScreen()),
                                            ),
                                          );
                                        },
                                        child: const Text('Sign Up'))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: ((context) => const HomeScreen()),
                      ),
                    );
                  },
                  child: Container(
                    width: 200,
                    margin: const EdgeInsets.only(left: 290),
                    decoration: const BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Text(
                            'Skip',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
  }
}
