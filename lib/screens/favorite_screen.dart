import 'package:flutter/material.dart';

import 'userProfile_screen.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var navigator = Navigator.of(context);

    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      navigator.pop();
                    },
                    icon: Icon(Icons.arrow_back_ios_new),
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
                      icon: Icon(Icons.people),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
