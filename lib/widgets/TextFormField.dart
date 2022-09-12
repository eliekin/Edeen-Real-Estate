import 'package:flutter/material.dart';


class TextFormFieldWidget extends StatelessWidget {
  late String labelText;
  late  FocusNode textFocusNode;
  late String textValue;

  TextFormFieldWidget(this.labelText, this.textFocusNode, this.textValue);

  @override
  Widget build(BuildContext context) {
        return TextFormField(
          keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              labelText: labelText,
              labelStyle: TextStyle(
                color: Colors.lightBlue,
              ),
            ),
            onFieldSubmitted: (_){
              return FocusScope.of(context).requestFocus(textFocusNode);
            },
            onChanged: (value){
                textValue = value;
            },
            textInputAction: TextInputAction.newline,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          );
  }
}