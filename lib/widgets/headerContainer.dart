import 'package:flutter/material.dart';
import '../screens/userProfile_screen.dart';

class HeaderContainer extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    var navigator = Navigator.of(context);
    return Container(
              padding: EdgeInsets.only(top: 20),
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
                            builder: (context) => UserProfileScreen(),
                          ),
                        );
                      },
                      icon: Icon(Icons.people),
                    ),
                  )
                ],
              ),
            );
  }
}