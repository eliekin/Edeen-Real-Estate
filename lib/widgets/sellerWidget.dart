import 'package:flutter/material.dart';

class sellerWidget extends StatelessWidget {
  String imageUrl;
  String price;
  String description;

  sellerWidget(
      {required this.description, required this.imageUrl, required this.price});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Card(
            elevation: 2.2,
            child: Dismissible(
              direction: DismissDirection.endToStart,
              key: Key('value'),
              onDismissed: (direction) {},
              background: Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 20),
                color: Colors.red,
                child: Icon(
                  Icons.delete_outline_rounded,
                  color: Colors.white,
                ),
              ),
              child: ListTile(
                leading: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
                subtitle: Text(price),
                title: Text(description),
                trailing: IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Colors.pink,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
