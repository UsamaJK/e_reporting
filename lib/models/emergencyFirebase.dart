import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<bool> emergencyReportSetup({
  required String firstName,
  required String lastName,
  required String email,
  required String phoneNumber,
  required String gender,
  required String city,
  required String cnic,
  required String address,
  required String occupation,
  required String category,
  required String description,
}) async {
  // print("FIREBASE METHOD SHOWING DISPLAY NAME: " + photoUrl);

  try {
    CollectionReference users =
        FirebaseFirestore.instance.collection('emergencyReporting');
    FirebaseAuth auth = FirebaseAuth.instance;
    // String uid = Random().nextInt(100).toString();
    // print("dsdasddsadsadasdsads${address}");
    // print("Photo URL IN FIREBASE.DART" + photoUrl);
    // await users.add({
    //   'displayName': displayName,
    //   'uid': uid,
    // });
    await users.add({
      "firstName": firstName,
      "lastName": lastName,
      "name": firstName + " " + lastName,
      // "uid": uid,
      "email": email,
      "phoneNo": phoneNumber,
      "gender": gender,
      "city": city,
      "cnic": cnic,
      "address": address,
      "occupation": occupation,
      "category": category,
      "description": description,
    });
    print("USER DATA IS SAVED");
    return true;
  } catch (error) {
    print("ERROR  = " + error.toString());
    return false;
  }
}
