import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/seller_screen.dart';

class clientCategory extends StatelessWidget {
  const clientCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RaisedButton(
          padding: EdgeInsets.symmetric(horizontal: 80),
          onPressed: () {
                        Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          },
          child: Text('Buy'),
        ),
        SizedBox(
          width: 10,
        ),
        RaisedButton(
          padding: EdgeInsets.symmetric(horizontal: 80),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => sellerScreen(),
              ),
            );
          },
          child: Text('Sell'),
        ),
      ],
    );
  }
}
