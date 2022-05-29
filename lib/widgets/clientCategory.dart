import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/seller_screen.dart';

class ClientCategory extends StatelessWidget {
  const ClientCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var navigator = Navigator.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildBtton(
            name: 'Buy',
            onPressed: () {
              navigator.push(
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
            },
            color: Colors.blue),
        SizedBox(
          width: 10,
        ),
        buildBtton(
            name: 'Sell',
            onPressed: () {
              navigator.push(
                MaterialPageRoute(
                  builder: (context) => SellerScreen(),
                ),
              );
            },
            color: Colors.blueAccent)
      ],
    );
  }

  @override
  Widget buildBtton(
      {required String name,
      required Function() onPressed,
      required Color color}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 130,
          height: 42.0,
          child: Text(name,style: TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}
