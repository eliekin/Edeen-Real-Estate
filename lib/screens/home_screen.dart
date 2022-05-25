import 'package:flutter/material.dart';

import '../widgets/clientCategory.dart';
import '../widgets/houseWidget.dart';
import '../widgets/popularWidget.dart';
import 'favorite_screen.dart';
import 'userProfile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border:
              Border.all(width: 4, color: Colors.redAccent.withOpacity(0.5)),
          color: Colors.white.withOpacity(0.9),
        ),
        child: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => favoriteScreen(),
              ),
            );
          },
          icon: Icon(
            Icons.favorite,
            color: Colors.redAccent,
            size: 30,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        'images/logo.png',
                        width: 50,
                        height: 50,
                      ),
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
              Text(
                'Recommanded',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              popularWidget(
                  imageUrl:
                      'https://images.pexels.com/photos/206172/pexels-photo-206172.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                  price: 'USD 2000'),
              SizedBox(
                height: 10,
              ),
              Text(
                'Find your happiness here',
                style: TextStyle(fontSize: 20),
              ),
              houseWidget(
                  description: 'the description goes here,',
                  imageUrl:
                      'https://static.dezeen.com/uploads/2020/02/house-in-the-landscape-niko-arcjitect-architecture-residential-russia-houses-khurtin_dezeen_2364_hero.jpg',
                  price: 'USD 2000'),
            ],
          ),
        ),
      ),
    );
  }
}
