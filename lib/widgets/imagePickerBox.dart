import 'package:flutter/material.dart';


class PickerImageBox extends StatelessWidget {
  const PickerImageBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        margin: EdgeInsets.only(top: 30),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue.withOpacity(
            0.2,
          ),
        ),
        child: Image.asset('images/logo.png',
            width: 50,
            height: 50,
            color: Colors.white.withOpacity(0.3),
            colorBlendMode: BlendMode.modulate),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 70),
        child: Center(
          child: Column(
            children: [
              Icon(
                Icons.camera_alt,
                color: Colors.blue,
                size: 60,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Pick a picture from gallery',
                style: TextStyle(color: Colors.blue, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}