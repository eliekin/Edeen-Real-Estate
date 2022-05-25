import 'package:flutter/material.dart';
import 'package:myproprety/screens/add_screen.dart';

import '../widgets/clientCategory.dart';
import '../widgets/sellerWidget.dart';
import 'userProfile_screen.dart';

class sellerScreen extends StatelessWidget {
  const sellerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 4,
            color: Colors.redAccent.withOpacity(0.9),
          ),
          color: Colors.white.withOpacity(0.9),
        ),
        child: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => addScreen(),
              ),
            );
          },
          icon: Icon(
            Icons.add,
            color: Colors.redAccent,
            size: 30,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
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
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => userProfileScreen(),
                            ),
                          );
                        },
                        icon: Icon(Icons.people),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              clientCategory(),
              SizedBox(
                height: 30,
              ),
              sellerWidget(
                  description: 'the description goes here',
                  imageUrl:
                      'https://static.dezeen.com/uploads/2020/02/house-in-the-landscape-niko-arcjitect-architecture-residential-russia-houses-khurtin_dezeen_2364_hero.jpg',
                  price: 'USD 2000')
            ],
          ),
        ),
      ),
    );
  }
}
