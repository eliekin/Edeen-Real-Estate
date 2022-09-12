import 'package:flutter/material.dart';

class UserTextField extends StatelessWidget {
  UserTextField(
      {Key? key,
      required this.userInput,
      required this.header,
      this.maxiline = 1})
      : super(key: key);

  TextEditingController userInput;
  String header;
  int maxiline;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        margin: const EdgeInsets.only(left: 0, right: 0, top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black26.withOpacity(0.1),
        ),
        child: TextFormField(
          decoration: InputDecoration(
            hintText: header,
            contentPadding: const EdgeInsets.only(
              left: 8,
              bottom: 2,
              top: 2
            ),
            border: InputBorder.none,
            hintStyle: const TextStyle(color: Colors.black),
          ),
          style: const TextStyle(color: Colors.black),
          maxLines: maxiline,
          onChanged: (value) {
            userInput.text = value;
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '$header is missing';
            }
            return null;
          },
        ),
      ),
    );
  }
}
