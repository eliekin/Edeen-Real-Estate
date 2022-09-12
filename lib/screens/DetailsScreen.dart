// ignore_for_file: must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:myproprety/screens/chat_screen.dart';
import 'package:myproprety/screens/userProfile_screen.dart';
import 'package:myproprety/widgets/drawer.dart';

class DetailsScreen extends StatefulWidget {
  String description;
  String price;
  String beds;
  String city;
  String province;
  String street_number;
  String street_address;
  String rent_sell;
  String baths;
  String garage;
  String superficie;
  String dateOfPublication;
  String postalCode;
  DetailsScreen({
    Key? key,
    required this.description,
    required this.price,
    required this.beds,
    required this.city,
    required this.province,
    required this.street_number,
    required this.street_address,
    required this.rent_sell,
    required this.baths,
    required this.garage,
    required this.superficie,
    required this.dateOfPublication,
    required this.postalCode
  }) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String imageUrl =
      'https://static.dezeen.com/uploads/2020/02/house-in-the-landscape-niko-arcjitect-architecture-residential-russia-houses-khurtin_dezeen_2364_hero.jpg';

  var checkUser = FirebaseAuth.instance.currentUser;
  bool showConact = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 2.0,
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Builder(
              builder: (context) => GestureDetector(
                child: Image.asset(
                  'images/logo.png',
                  width: 50,
                  height: 50,
                ),
                onTap: () => Scaffold.of(context).openDrawer(),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5.5,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => UserProfileScreenForm(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.person,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ]),
      drawer: const DrawerEdited(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 30, left: 10, right: 10),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
      
              const SizedBox(
                height: 10,
              ),
      
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  dispayedDetails(
                      context, Icons.bed_rounded, widget.beds, 'Beds'),
                  dispayedDetails(
                      context, Icons.bathroom_rounded, widget.baths, 'Baths'),
                  dispayedDetails(
                      context, Icons.garage_rounded, widget.garage, 'Garages'),
                  dispayedDetails(context, Icons.house_rounded, widget.rent_sell,
                      'Rent/Sell'),
                       dispayedDetails(context, Icons.numbers_rounded, widget.postalCode,
                      'Postal Code'),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Row(
                    children: const [
                      Icon(Icons.place_rounded),
                      Text('Address',
                          style: TextStyle(fontWeight: FontWeight.w500)),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  SizedBox(
                    width: double.infinity,
                    // padding: const EdgeInsets.all(30),
                    // decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.blueGrey.withOpacity(0.3)),
                    child: Text(
                      "${widget.street_number} ${widget.street_address}, ${widget.city}",
                      style: const TextStyle(fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.map_rounded),
                      Text(
                        'Province',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      widget.province,
                      style: const TextStyle(fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.date_range_rounded),
                      Text(
                        'Published Day',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      widget.dateOfPublication,
                      style: const TextStyle(fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
      
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.description_rounded),
                      Text('Description',
                          style: TextStyle(fontWeight: FontWeight.w500)),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      widget.description,
                      style: const TextStyle(
                          letterSpacing: 0.5, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
      
              // SizedBox(
              //   width: MediaQuery.of(context).size.width / 2.3,
              //   child: ElevatedButton(
              //     onPressed: showConact ? () async {
              //       if(checkUser != null) {
              //         setState(() {
              //           showConact = true;
              //         });
              //         print(showConact);
              //       }
              //       else{
              //         Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserProfileScreenForm()),);
              //       }
              //     } : () {
              //       Navigator.of(context).push(MaterialPageRoute(builder: (context) => UserProfileScreenForm()),);
              //     } ,
              //     child: Row(
              //       children: [
              //         const Icon(Icons.phone),
              //         SizedBox(
              //           width: MediaQuery.of(context).size.width / 40,
              //         ),
              //         const Text('Show contact'),
              //       ],
              //     ),
              //   ),
              // ),
              ElevatedButton(
                onPressed: () {
                  if (checkUser != null) {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const ChatScreen()),
                    );
                  } else if (checkUser == null) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => UserProfileScreenForm()),
                    );
                  }
                },
                child: const Text('Start chat with seller'),
              )
            ],
          ),
        ),
      ),
    );
  }

  SizedBox constBox(BuildContext context) => SizedBox(
        height: MediaQuery.of(context).size.width / 35,
      );

  Column dispayedDetails(
      BuildContext context, IconData icon, String contain, String title) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 4,
        ),
        Row(
          children: [
            Icon(
              icon,
              color: Colors.blueGrey,
            ),
            const SizedBox(
              width: 2,
            ),
            Text(
              contain,
              style: const TextStyle(fontWeight: FontWeight.w400),
            )
          ],
        ),
      ],
    );
  }
}
