import 'package:flutter/material.dart';
import 'package:myproprety/widgets/headerContainer.dart';

import '../widgets/clientCategory.dart';
import '../widgets/houseWidget.dart';
import '../widgets/popularWidget.dart';
import 'chat_screen.dart';
import 'favorite_screen.dart';
import '../widgets/floatingButton.dart';
import 'package:draggable_fab/draggable_fab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    controller.addListener(() {
      void text() {
        Column(
          children: [
            Image.asset(
              'images/logo.png',
              width: 100,
              height: 100,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'EDEEN REAL ESTATE',
              style: TextStyle(letterSpacing: 2, fontSize: 20),
            ),
          ],
        );
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var navigator = Navigator.of(context);

    return Scaffold(
      floatingActionButton: DraggableFab(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
          FloatingButton(onPresssed: () {
            navigator.push(MaterialPageRoute(builder: (context) => FavoriteScreen()),);
          }, icon: Icons.favorite),
          SizedBox(width: 5,),
          FloatingButton(onPresssed: (){
            navigator.push(MaterialPageRoute(builder: (context) => ChatScreen(),),);
          }, icon: Icons.message)
        ],),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderContainer(),
              SizedBox(
                height: 20,
              ),
              ClientCategory(),
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
              PopularWidget(
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
              HouseWidget(
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
