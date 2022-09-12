import 'package:flutter/material.dart';
import 'package:myproprety/screens/add_screen.dart';
import 'package:myproprety/screens/userProfile_screen.dart';
import 'package:myproprety/widgets/drawer.dart';
import '../widgets/sellerWidget.dart';



class SellerScreen extends StatelessWidget {
  const SellerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var navigator = Navigator.of(context);
    return Scaffold(
           appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left:8.0),
          child: Builder(
            builder: (context) => GestureDetector(
              child: Image.asset(
                'images/logo.png',
                width: 50,
                height: 50,
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
                  color: Colors.blue,
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: 
          FloatingActionButton(
            child: const Icon(Icons.add),
             onPressed: () {
                navigator.push(
                  MaterialPageRoute(
                    builder: ((context) => const AddScreen()),
                  ),
                );
              },
               elevation: 3,
             ),
      drawer: const DrawerEdited(),
      body: ListView(
        children: [
          sizedBox(),
          sizedBox(),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: const Text(
              'Your posts',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          sizedBox(),
          Container(
            height: 600,
            width: 600,
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: SellerWidget(),
          ),
        ],
      ),
    );
  }

  SizedBox sizedBox() {
    return  const SizedBox(
      height: 20,
    );
  }
}
