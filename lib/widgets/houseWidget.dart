import 'package:flutter/material.dart';

class houseWidget extends StatelessWidget {
  String imageUrl;
  String description;
  String price;

  houseWidget(
      {required this.price, required this.imageUrl, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: 20,
        scrollDirection: Axis.vertical,
        itemBuilder: ((context, index) {
          return Card(
            color: Colors.black26.withOpacity(0.05),
            elevation: 0.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  child: Image.network(imageUrl),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(price),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10,bottom: 10),
                  child: Text(description),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
