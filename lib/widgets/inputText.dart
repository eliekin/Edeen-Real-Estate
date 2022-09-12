import 'package:flutter/material.dart';


  InputDecoration InputText(String hinText) {
    return InputDecoration(
      
              hintText: hinText,
              hintStyle:const TextStyle(color: Colors.black26),          
              contentPadding:
                const  EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
              // border: OutlineInputBorder(
              //   borderRadius: BorderRadius.all(Radius.circular(10.0)),
              // ),
              // enabledBorder: OutlineInputBorder(
              //   borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
              //   borderRadius: BorderRadius.all(Radius.circular(10.0)),
              // ),
              // focusedBorder: OutlineInputBorder(
              //   borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
              //   borderRadius: BorderRadius.all(Radius.circular(10.0)),
              // ),
            );
  }