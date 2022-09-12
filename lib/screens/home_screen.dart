import 'package:flutter/material.dart';
import 'package:myproprety/screens/seller_screen.dart';
import 'package:myproprety/screens/userProfile_screen.dart';
import 'package:myproprety/widgets/drawer.dart';
import 'package:myproprety/widgets/headerContainer.dart';

import '../widgets/clientCategory.dart';
import '../widgets/houseWidget.dart';
import '../widgets/popularWidget.dart';
import 'chat_screen.dart';
import 'favorite_screen.dart';
import '../widgets/floatingButton.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<dynamic> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    controller.addListener(() {
      void text() {
        Column(
          children: [
            Hero(
              tag: 'logo',
              child: Image.asset(
                'images/logo.png',
                width: 100,
                height: 100,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
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
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Builder(
            builder: (context) => GestureDetector(
              child: Hero(
                tag: 'logo',
                child: Image.asset(
                  'images/logo.png',
                  width: 50,
                  height: 50,
                ),
              ),
              onTap: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Card(
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
                icon: const Icon(
                  Icons.person,
                  color: Colors.lightBlue,
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionBubble(
        animation: _animation,
        backGroundColor: Colors.blueGrey,
        onPress: () => _animationController.isCompleted
            ? _animationController.reverse()
            : _animationController.forward(),
        iconData: Icons.menu_rounded,
        // backGroundColor: Colors.white,
        iconColor: Colors.white,
        items: [
          Bubble(
            title: "Sell",
            iconColor: Colors.white,
            bubbleColor: Colors.blueGrey,
            icon: Icons.sell_rounded,
            titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
            onPress: () {
              _animationController.reverse();
              navigator.push(
                MaterialPageRoute(
                  builder: (context) => const SellerScreen(),
                ),
              );
            },
          ),
          Bubble(
            title: "Message",
            iconColor: Colors.white,
            bubbleColor: Colors.blueGrey,
            icon: Icons.message_rounded,
            titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
            onPress: () {
              _animationController.reverse();
            },
          ),
        ],
      ),
      drawer: const DrawerEdited(),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Find your happiness here',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              HouseWidget(
                imageUrl:
                    'https://static.dezeen.com/uploads/2020/02/house-in-the-landscape-niko-arcjitect-architecture-residential-russia-houses-khurtin_dezeen_2364_hero.jpg',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
