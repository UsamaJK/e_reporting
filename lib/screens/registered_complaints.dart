import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_reporting/screens/detail_registeredComplaintScreen.dart';
import 'package:e_reporting/widgets/app_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisteredComplaints extends StatefulWidget {
  static const String routeName = "/registeredComplaints";
  const RegisteredComplaints({Key? key}) : super(key: key);

  @override
  _RegisteredComplaintsState createState() => _RegisteredComplaintsState();
}

class _RegisteredComplaintsState extends State<RegisteredComplaints> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: const Text(
          "Registered Complaints",
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("simpleReports")
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
                      DetailRegisteredComplaintScreen.routeName,
                      arguments: currentDoc);
                },
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Text(
                    currentDoc.id[0].toUpperCase(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
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
