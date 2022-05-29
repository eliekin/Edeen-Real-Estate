import 'package:flutter/material.dart';


class FloatingButton extends StatelessWidget {

  late Function() onPresssed;
  late IconData icon;

  FloatingButton({required this.onPresssed,required this.icon});

  @override
  Widget build(BuildContext context) {
      return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
            width: 4, color: Colors.lightBlueAccent.withOpacity(0.5)),
        color: Colors.white.withOpacity(0.9),
      ),
      child: IconButton(
        onPressed: onPresssed,
        icon: Icon(
          icon,
          color: Colors.blue,
          size: 30,
        ),
      ),
    );
  }
}