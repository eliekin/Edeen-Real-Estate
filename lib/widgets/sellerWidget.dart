import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../functions/UploadImage.dart';

class SellerWidget extends StatefulWidget {
  // String imageUrl;

  // SellerWidget({
  //   required this.imageUrl,
  // });

  @override
  State<SellerWidget> createState() => _SellerWidgetState();
}

class _SellerWidgetState extends State<SellerWidget> {
  final userStorage imageUrl = userStorage();
  List? userPostededData;
  Future<List> fetchAllContact() async {
    var userId = FirebaseAuth.instance.currentUser!.uid;
    var userCollectionId =
        await FirebaseFirestore.instance.collection('housesInfo').get();

    List itemList = [];
    await FirebaseFirestore.instance
        .collection('housesInfo')
        .get()
        .then((QuerySnapshot) {
      if (QuerySnapshot.docs.isEmpty) {
        return;
      } else {
        QuerySnapshot.docs.forEach((element) {
          for (var snpashot in userCollectionId.docs) {
            if (element.id == userId) {
              itemList.add(element.data()['housesDetails']);
            } else {
              print('You have no preprety added yet');
            }
          }
        });
      }
    });
    return itemList;
  }

  appAllUserData() async {
    var result = await fetchAllContact();
    setState(() {
      userPostededData = result[0];
    });
  }

  @override
  void initState() {
    super.initState();
    appAllUserData();
  }

  @override
  Widget build(BuildContext context) {
    return userPostededData == null
        ? Container(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
            alignment: Alignment.topCenter,
            child: const Text(
              'You have no proprety added yet',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.orange),
            ),
          )
        : SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              itemCount: userPostededData!.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2.2,
                  child: Dismissible(
                    direction: DismissDirection.endToStart,
                    key: const Key('value'),
                    onDismissed: (direction) {},
                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 20),
                      color: Colors.red,
                      child: const Icon(
                        Icons.delete_outline_rounded,
                        color: Colors.white,
                      ),
                    ),
                    child: FutureBuilder(
                      future: imageUrl
                          .downLoadImage(userPostededData![index]['imageUrl']),
                      builder: ((context, AsyncSnapshot<dynamic> snapshot) {
                        // if (!snapshot.hasData) {
                        //   return Container(
                        //     margin: EdgeInsets.symmetric(
                        //         vertical:
                        //             MediaQuery.of(context).size.height / 2),
                        //     alignment: Alignment.center,
                        //     child: const CircularProgressIndicator(
                        //       color: Colors.orange,
                        //     ),
                        //   );
                        // }
                        return ListTile(
                          // leading: SizedBox(
                          //   height: 50,
                          //   width: 50,
                          //   child: Image.network(
                          //     snapshot.data.toString(),
                          //     fit: BoxFit.cover,
                          //   ),
                          // ),
                          title: Text(
                            "${userPostededData![index]['street_number']} ${userPostededData![index]['street_address']}, ${userPostededData![index]['city']}",
                          ),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.pink,
                            ),
                            onPressed: () {},
                          ),
                        );
                      }),
                    ),
                  ),
                );
              },
            ),
          );
  }
}
