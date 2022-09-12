import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../screens/DetailsScreen.dart';

// ignore: must_be_immutable
class HouseWidget extends StatefulWidget {
  String imageUrl;

  HouseWidget({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  State<HouseWidget> createState() => _HouseWidgetState();
}

class _HouseWidgetState extends State<HouseWidget> {
  List houses = [];

  fletchHouses() async {
    List houseList = [];
    await FirebaseFirestore.instance
        .collection('housesInfo')
        .get()
        .then((QuerySnapshot) {
      if (QuerySnapshot.docs.isEmpty) {
        return 'no data';
      } else {
        QuerySnapshot.docs.forEach((element) {
          houseList.add(element.data()['housesDetails']);
        });
      }
    });
    return houseList;
  }

  void getHouses() async {
    // TODO: implement initState
    var resonse = await fletchHouses();
    setState(() {
      for (var i in resonse) {
        for (var element in i) {
          houses.add(element);
        }
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHouses();
    // print(houses);
  }

  @override
  Widget build(BuildContext context) {
    return houses.isEmpty
        ? Container(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
            alignment: Alignment.topCenter,
            child: const CircularProgressIndicator(
              color: Colors.orange,
            ),
          )
        : SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
                itemCount: houses.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.white,
                    elevation: 0.5,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.network(
                                widget.imageUrl,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 130.0,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.5),
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(5),
                                    bottomRight: Radius.circular(5),
                                  ),
                                ),
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.bed_rounded,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            houses[index]['beds'],
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.bathroom_rounded,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            houses[index]['baths'],
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.garage_rounded,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            houses[index]['garage'],
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.house_rounded,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            houses[index]['rent_sell'],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 0, bottom: 5),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.attach_money_rounded,
                                  ),
                                  const SizedBox(
                                    width: 0,
                                  ),
                                  Text(
                                    houses[index]['rent_sell'] == 'Rent'
                                        ? '${houses[index]['price']} /month'
                                        : '${houses[index]['price']}',
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              // mainAxisAlignment:MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 0, bottom: 0),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.place_outlined,
                                      ),
                                      Text(
                                        "${houses[index]['street_number']} ${houses[index]['street_address']}, ${houses[index]['city']}",
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 0,
                                bottom: 0,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: ((context) => DetailsScreen(
                                            description:
                                                'house for rent in central Kampala Uganda, 15 minutes from the Nakasero market and 20 minutes from old park taxis, have water and electricity, two people in concession',
                                            price: houses[index]['price'],
                                            beds: houses[index]['beds'],
                                            city: houses[index]['city'],
                                            province: houses[index]['province'],
                                            street_number: houses[index]
                                                ['street_number'],
                                            street_address: houses[index]
                                                ['street_address'],
                                            rent_sell: houses[index]
                                                ['rent_sell'],
                                            baths: houses[index]['baths'],
                                            garage: houses[index]['garage'],
                                            superficie: houses[index]
                                                ['superficie'],
                                            dateOfPublication: houses[index]
                                                ['dateOfPublication'],
                                            postalCode: houses[index]
                                                ['postalCode'],
                                          )),
                                    ),
                                  );
                                },
                                child: const Card(
                                  color: Colors.lightBlue,
                                  child: Padding(
                                    padding: EdgeInsets.all(4),
                                    child: Text(
                                      'Details...',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(houses[index]['dateOfPublication']),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                }));
  }
}
      // child: StreamBuilder<QuerySnapshot>(
      //   stream: _usersStream,
      //   builder: ((context, AsyncSnapshot<QuerySnapshot> snapshot) {
      //     if (snapshot.hasError) return Text('Error = ${snapshot.error}');
      //     if (!snapshot.hasData) {
      //       return 
      //   }),
      // ),
