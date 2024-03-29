import 'package:flutter/material.dart';

class Button extends StatelessWidget {

  String Name;
  Color color;
  Function() function;

  Button({required this.Name,required this.color, required this.function});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(10.0),
        
        child: MaterialButton(
          onPressed: function,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            Name
          ),
        ),
      ),
    );
  }
}
