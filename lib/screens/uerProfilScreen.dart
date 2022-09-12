import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProfilScreen extends StatefulWidget {
  @override
  State<UserProfilScreen> createState() => _UserProfilScreenState();
}

class _UserProfilScreenState extends State<UserProfilScreen> {
  // const UserProfilScreen({Key? key}) : super(key: key);
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();

  List userPostededData = [];

  Future<List> fetchAllContact() async {
    var userId = await FirebaseAuth.instance.currentUser!.uid;
    var userCollectionId =
        await FirebaseFirestore.instance.collection('housesInfo').get();

    List itemList = [];
    await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((QuerySnapshot) {
      if (QuerySnapshot.docs.isEmpty) {
        return const Text('You have no account, Sign up to create one');
      } else {
        QuerySnapshot.docs.forEach((element) {
          for (var snpashot in userCollectionId.docs) {
            if (element.id == userId) {
              itemList.add(element.data());
              // print('this is the docs ${snpashot.id}');
              // print('this is the userId $userId');
            } else {
              return;
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
      userPostededData = result;
    });
  }

  @override
  void initState() {
    super.initState();
    appAllUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:false,
        title: const Text('Profil'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: userPostededData.length,
        itemBuilder: ((context, index) {
          return Stack(children: [
            Padding(
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 5),
              child: Container(
                color: Colors.blueGrey,
                width: MediaQuery.of(context).size.width,
                height: 300,
              ),
            ),
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 70, vertical: 15),
                  child: CircleAvatar(
                    foregroundImage: NetworkImage(
                        'https://m.media-amazon.com/images/M/MV5BMjM2MDc0NzQ2N15BMl5BanBnXkFtZTgwODUwMDEyMzE@._V1_.jpg'),
                    maxRadius: 100,
                  ),
                ),
                Card(
                  margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 10,
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 10,
                        vertical: MediaQuery.of(context).size.height / 20),
                    child: Column(
                      children: [
                        userCard('Name', userPostededData[index]['name'],
                            Icons.person_sharp),
                        consSizedBox(),
                        userCard('Email Address',
                            userPostededData[index]['email'], Icons.mail),
                        consSizedBox(),
                        userCard(
                            'Phone Nomber',
                            userPostededData[index]['phoneNumber'],
                            Icons.phone),
                        Container(
                          margin: const EdgeInsets.only(left: 160),
                          width: 70,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(10),
                            child: const Center(
                              child: Text(
                                'Edit',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                consSizedBox(),
              ],
            ),
          ]);
        }),
      ),
    );
  }

  SizedBox consSizedBox() {
    return const SizedBox(
      height: 10,
    );
  }

  Column userCard(String header, String name, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon),
            const SizedBox(
              width: 10,
            ),
            Text(header),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 35),
          child: Text(
            name,
            style: const TextStyle(fontSize: 15, color: Colors.blue),
          ),
        )
      ],
    );
  }
}
