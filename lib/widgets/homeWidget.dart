import 'package:flutter/material.dart';

class HomeWdiget extends StatelessWidget {
  String price;
  String description;
  String imageUrl;

  HomeWdiget(
      {required this.description, required this.imageUrl, required this.price});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 10),
        itemCount: 200,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5.5,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('$price'),
                SizedBox(
                  height: 5,
                ),
                Text(description)
              ],
            ),
          );
        });
  }
}
