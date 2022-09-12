import 'package:flutter/material.dart';
import '../screens/userProfile_screen.dart';

class HeaderContainer extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    var navigator = Navigator.of(context);
    return Container(
              padding:const EdgeInsets.only(top: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'images/logo.png',
                    width: 50,
                    height: 50,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5.5,
                    child: IconButton(
                      onPressed: () {
                        navigator.push(
                          MaterialPageRoute(
                            builder: (context) => UserProfileScreenForm(),
                          ),
                        );
                      },
                      icon: Icon(Icons.person),
                    ),
                  )
                ],
              ),
            );
  }
}