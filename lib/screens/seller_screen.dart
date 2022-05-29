import 'package:flutter/material.dart';
import 'package:myproprety/screens/add_screen.dart';
import 'package:myproprety/widgets/headerContainer.dart';

import '../widgets/clientCategory.dart';
import '../widgets/sellerWidget.dart';
import 'chat_screen.dart';
import '../widgets/floatingButton.dart';
import 'package:draggable_fab/draggable_fab.dart';

class SellerScreen extends StatelessWidget {
  const SellerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var navigator = Navigator.of(context);

    return Scaffold(
      floatingActionButton: DraggableFab(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingButton(onPresssed: () {
              navigator.push(MaterialPageRoute(builder: ((context) => AddScreen())));
            }, icon: Icons.add),
            SizedBox(
              width: 5,
            ),
          FloatingButton(onPresssed: () {
             navigator.push(MaterialPageRoute(builder: (context)=>ChatScreen(),),);
          }, icon: Icons.message)
          ],
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderContainer(),
              SizedBox(
                height: 20,
              ),
              ClientCategory(),
              SizedBox(
                height: 30,
              ),
              SellerWidget(
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
