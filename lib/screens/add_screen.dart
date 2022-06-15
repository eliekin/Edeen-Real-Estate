import 'package:flutter/material.dart';

import '../widgets/TextFormField.dart';
import 'userProfile_screen.dart';
import '../widgets/imagePickerBox.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _descriptionFocusNode = FocusNode();

  @override
  void dispose() {
    _descriptionFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var navigator = Navigator.of(context);

    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Form(
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        navigator.pop();
                      },
                      icon: Icon(Icons.arrow_back_ios_new),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 5.5,
                      child: IconButton(
                        onPressed: () {
                          navigator.push(
                            MaterialPageRoute(
                              builder: (context) => UserProfileScreen(),
                            ),
                          );
                        },
                        icon: Icon(Icons.people),
                      ),
                    )
                  ],
                ),
              ),
              PickerImageBox(),
              TextFormFieldWidget('Price', _descriptionFocusNode),
              TextFormFieldWidget('Description', _descriptionFocusNode),
               TextFormFieldWidget('Address', _descriptionFocusNode),
              Container(
                padding: EdgeInsets.only(top: 30),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Add'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
