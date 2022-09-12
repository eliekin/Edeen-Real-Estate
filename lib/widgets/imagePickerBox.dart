import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase;
// import 'package:image_picker/image_picker.dart';
import '../functions/UploadImage.dart';

class PickerImageBox extends StatefulWidget {
  @override
  State<PickerImageBox> createState() => _PickerImageBoxState();
}

class _PickerImageBoxState extends State<PickerImageBox> {
  // const PickerImageBox({
  final userStorage storage = userStorage();

  List<File> imageFile = [];
  // final picker = ImagePicker();

  bool isImageLoaded = false;

  // ignore: prefer_typing_uninitialized_variables
  var pickedImage;

  void _pickImages() async {
    // var pickedImageFile = await ImagePicker().pickImage(
    //     imageQuality: 100,
    //     source: ImageSource.gallery,
    //     maxHeight: MediaQuery.of(context).size.height / 3,
    //     maxWidth: MediaQuery.of(context).size.width);
    // if (pickedImageFile == null) {
    //   return null;
    // }

    // final path = pickedImageFile.path;
    // final fileName = "housesImages/${pickedImageFile.name}";
    // await firebase.FirebaseStorage.instance
    //     .ref()
    //     .child(fileName)
    //     .putFile(File(path));

    // setState(() {
    //   pickedImage = File(pickedImageFile.path);
    // });

    // User? user = FirebaseAuth.instance.currentUser;

    // await FirebaseFirestore.instance
    //     .collection('housesInfo')
    //     .doc(user!.uid.toString())
    //     .set(
    //   {
    //     'housesDetails':FieldValue.arrayUnion([
    //       {
    //         'imageUrl': pickedImageFile.name,
    //       }
    //     ])

    //   },
    //   SetOptions(merge: true),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return pickedImage != null
        ? Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.blueGrey.withOpacity(
                0.1,
              ),
            ),
            margin: const EdgeInsets.only(top: 30),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3,
            child: GestureDetector(
              onTap: _pickImages,
              child: Image(
                image: FileImage(pickedImage),
              ),
            ),
          )
        : Stack(children: [
            GestureDetector(
              onTap: () {
                _pickImages();
              },
              child: Container(
                margin: const EdgeInsets.only(top: 30),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.blueGrey.withOpacity(
                    0.2,
                  ),
                ),
                child: Image.asset('images/logo.png',
                    width: 50,
                    height: 50,
                    color: Colors.white.withOpacity(0.3),
                    colorBlendMode: BlendMode.modulate),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 70),
              child: Center(
                child: Column(
                  children: const [
                    Icon(
                      Icons.folder_rounded,
                      size: 60,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Pick files from gallery',
                      style: TextStyle(fontSize: 20, color: Colors.blueGrey),
                    ),
                  ],
                ),
              ),
            ),
          ]);
  }
}
