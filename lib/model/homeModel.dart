import 'package:flutter/material.dart';

class HomeModel {
  String name;
  String description;
  String imageUrl;
  DateTime date;
  String price;

  HomeModel(
      {required this.name,
      required this.description,
      required this.price,
      required this.imageUrl,
      required this.date});
}
