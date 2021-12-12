// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<bool> reportSetupPolice({
  required String firstName,
  required String lastName,
  required String phoneNumber,
  required String city,
  required String address,
  required String email,
  required String officerName,
  required String badgeNo,
  required String description,
}) async {
  // print("FIREBASE METHOD SHOWING DISPLAY NAME: " + photoUrl);

  try {
    CollectionReference users =
        FirebaseFirestore.instance.collection('policeReports');
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser!.uid.toString();
    // print("Photo URL IN FIREBASE.DART" + photoUrl);
    // await users.add({
    //   'displayName': displayName,
    //   'uid': uid,
    // });
    await users.add({
      "firstName": firstName,
      "lastName": lastName,
      "name": firstName + " " + lastName,
      "phoneNo": phoneNumber,
      "city": city,
      "address": address,
      "email": auth.currentUser!.email,
      "uid": uid,
      // "gender": gender,
      "officerName": officerName,
      "badgeNo": badgeNo,
      // "category": category,
      "description": description,
    });
    print("USER DATA IS SAVED");
    return true;
  } catch (error) {
    print("ERROR  = " + error.toString());
    return false;
  }
}
