import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myproprety/screens/seller_screen.dart';
import 'package:myproprety/screens/userProfile_screen.dart';
import 'package:myproprety/widgets/imagePickerBox.dart';
import 'package:myproprety/widgets/userTextField.dart';
// import '../widgets/inputText.dart';
// import '../widgets/imagePickerBox.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController userStreetNumberInput = TextEditingController();
  TextEditingController userStreetAddressInput = TextEditingController();
  TextEditingController userCityInput = TextEditingController();
  TextEditingController userProvinceInput = TextEditingController();
  TextEditingController userPostalCodeInput = TextEditingController();
  String? _dropDownValue;
  TextEditingController userPriceInput = TextEditingController();
  TextEditingController userBedsInput = TextEditingController();
  TextEditingController userBathsInput = TextEditingController();
  TextEditingController userGarageInput = TextEditingController();
  TextEditingController userSupercifieInput = TextEditingController();
  TextEditingController userDescriptionInput = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    userStreetNumberInput.dispose();
    userBathsInput.dispose();
    userBedsInput.dispose();
    userStreetAddressInput.dispose();
    userPriceInput.dispose();
    userGarageInput.dispose();
    userCityInput.dispose();
    userProvinceInput.dispose();
    userDescriptionInput.dispose();
    userPostalCodeInput.dispose();
    userSupercifieInput.dispose();
  }

  final GlobalKey<FormState> _add = GlobalKey<FormState>();

  bool isLoading = false;

  var dateString = DateFormat.yMEd().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 2.0,
          title: const Text('Add Proprety'),
          centerTitle: true),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Form(
          key: _add,
          child: ListView(
            children: [
              PickerImageBox(),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'PROPRETY ADDRESS',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black54),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 150,
                    height: 90,
                    child: UserTextField(
                        userInput: userStreetNumberInput,
                        header: 'Street Number'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 160,
                    height: 90,
                    child: UserTextField(
                        userInput: userStreetAddressInput,
                        header: 'Street Address'),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(right: 10),
                child: UserTextField(
                    userInput: userCityInput, header: 'City', maxiline: 1),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 150,
                    height: 90,
                    child: UserTextField(
                        userInput: userProvinceInput,
                        header: 'Province',
                        maxiline: 1),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 160,
                    height: 90,
                    child: UserTextField(
                        userInput: userPostalCodeInput,
                        header: 'Postal Code',
                        maxiline: 1),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'PROPRETY DETAILS',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.black54),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: Colors.black26.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 300,
                height: 50,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                      isExpanded: true,
                      borderRadius: BorderRadius.circular(10),
                      icon: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 30,
                      ),
                      hint: _dropDownValue == null
                          ? const Padding(
                              padding: EdgeInsets.only(left: 3.0),
                              child: Text('Rent/Sell'),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(left: 3.0),
                              child: Text(_dropDownValue!),
                            ),
                      items: <String>['Rent', 'Sell'].map((String val) {
                        return DropdownMenuItem<String>(
                          value: val,
                          child: Text(val),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          _dropDownValue = val;
                        });
                      }),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 10),
                child: UserTextField(
                  userInput: userPriceInput,
                  header: 'Price',
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 100,
                    height: 90,
                    child: UserTextField(
                      userInput: userBedsInput,
                      header: 'Beds',
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 100,
                    height: 90,
                    child: UserTextField(
                      userInput: userBathsInput,
                      header: 'Baths',
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 100,
                    height: 90,
                    child: UserTextField(
                      userInput: userGarageInput,
                      header: 'Garage',
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(right: 10),
                child: UserTextField(
                  userInput: userSupercifieInput,
                  header: 'Surpeficie',
                ),
              ),
              // Container(
              //   margin: const EdgeInsets.only(right: 10),
              //   child: UserTextField(
              //       userInput: userSupercifieInput,
              //       header: 'Description',
              //       maxiline: 6),
              // ),

              const SizedBox(
                height: 10,
              ),

              Container(
                padding: const EdgeInsets.only(
                    top: 10, left: 100, bottom: 10, right: 100),
                child: ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                    try {
                      if (_add.currentState!.validate()) {
                        User? user = FirebaseAuth.instance.currentUser;
                        if (user == null) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => UserProfileScreenForm()),
                          );
                        }

                        await FirebaseFirestore.instance
                            .collection('housesInfo')
                            .doc(user!.uid.toString())
                            .set(
                          {
                            'housesDetails': FieldValue.arrayUnion([
                              {
                                'street_number': userStreetNumberInput.text,
                                'street_address': userStreetAddressInput.text,
                                'city': userCityInput.text,
                                'province': userProvinceInput.text,
                                'rent_sell': _dropDownValue,
                                'price': userPriceInput.text,
                                'beds': userBedsInput.text,
                                'baths': userBathsInput.text,
                                'garage': userGarageInput.text,
                                'superficie': userSupercifieInput.text,
                                'description':
                                    'house for rent in central Kampala Uganda, 15 minutes from the Nakasero market and 20 minutes from old park taxis, have water and electricity, two people in concession',
                                'dateOfPublication': dateString,
                                'postalCode': userPostalCodeInput.text
                              }
                            ])
                          },
                          SetOptions(merge: true),
                        );

                        setState(
                          () {
                            isLoading = false;
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const SellerScreen()),
                            );
                          },
                        );
                      }
                    } catch (e) {
                      setState(() {
                        isLoading = false;
                      });
                      const SnackBar(
                        backgroundColor: Colors.white,
                        content: Text(
                          'Please enter valid information',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.red),
                        ),
                      );
                    }
                  },
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
