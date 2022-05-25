import 'package:flutter/material.dart';

class popularWidget extends StatelessWidget {
  String imageUrl;
  String price;
  popularWidget(
      {required this.imageUrl, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
           width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            elevation: 0.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width/2.3,
                  height: MediaQuery.of(context).size.height/5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Image.network(imageUrl,fit: BoxFit.cover,),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(price),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
