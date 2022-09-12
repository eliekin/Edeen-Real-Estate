import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase;
import 'package:firebase_core/firebase_core.dart' as firebase_core;

// ignore: camel_case_types
class userStorage {

  final firebase.FirebaseStorage storage = firebase.FirebaseStorage.instance;
 uploadFile(String filePath, String fileName) async {
    File file = File(filePath);
    try {
      await storage.ref('userUploadedImages/$fileName').child(filePath).putFile(file);
    } catch (e) {
      print(e);
    }
  }

   listFiles() async {
    firebase.ListResult results =
        await storage.ref('userUploadedImages').listAll();

    results.items.forEach((firebase.Reference ref) {
      print(ref);
    });

    return results;
  }

   downLoadImage(dynamic imageName) async {
    String downloadUrl =
        await storage.ref('housesImages/$imageName').getDownloadURL();

    return downloadUrl;
  }
}
