import 'package:flutter/material.dart';

class HouseWidget extends StatelessWidget {
  String imageUrl;
  String address;
  String price;

  HouseWidget(
      {required this.price, required this.imageUrl, required this.address});

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
                  child: Stack(
                    children: [
                      Image.network(imageUrl),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                            alignment: Alignment.topRight,
                            child: Card(
                              child: IconButton(
                                icon: Icon(
                                  Icons.favorite_border_rounded,
                                  size: 35,
                                  color: Colors.cyan,
                                ),
                                onPressed: () {
                                },
                              ),
                            )),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 14,bottom: 10),
                  child: Text(price),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:10.0, bottom: 10),
                  child: Row(children: [
                    Icon(Icons.place_outlined), 
                    Text(address)
                  ],),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 10,),
                      child: Card(
                        color: Colors.blueAccent,
                        child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('Details...', style: TextStyle(color: Colors.white),),
                      ),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Date of publication'),
                    )
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
