// ignore_for_file: curly_braces_in_flow_control_structures, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_reporting/screens/detail_registeredPoliceComplaintsScreen.dart';
import 'package:e_reporting/widgets/app_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisteredPoliceComplaints extends StatefulWidget {
  static const String routeName = "/RegisteredPoliceComplaints";
  const RegisteredPoliceComplaints({Key? key}) : super(key: key);

  @override
  _RegisteredPoliceComplaintsState createState() =>
      _RegisteredPoliceComplaintsState();
}

class _RegisteredPoliceComplaintsState
    extends State<RegisteredPoliceComplaints> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: const Text(
          "Registered Police Complaints",
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("policeReports")
            .where("email", isEqualTo: FirebaseAuth.instance.currentUser!.email)
            .snapshots(),
        builder: (ctx, snapshot) {
          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );
          var listDocs = snapshot.data!.docs;
          return ListView.builder(
            itemCount: listDocs.length,
            itemBuilder: (ctx, index) {
              var currentDoc = listDocs[index];
              return ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed(
                      DetailRegisteredPoliceComplaintsScreen.routeName,
                      arguments: currentDoc);
                },
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Text(
                    currentDoc.id[0].toUpperCase(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                trailing: Icon(
                  Icons.local_police,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  currentDoc.id,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
