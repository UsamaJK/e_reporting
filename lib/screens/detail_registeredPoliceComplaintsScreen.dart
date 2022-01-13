// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DetailRegisteredPoliceComplaintsScreen extends StatefulWidget {
  static const String routeName = "DetailRegisteredPoliceComplaints";
  const DetailRegisteredPoliceComplaintsScreen({Key? key}) : super(key: key);

  @override
  _DetailRegisteredPoliceComplaintsScreenState createState() =>
      _DetailRegisteredPoliceComplaintsScreenState();
}

class _DetailRegisteredPoliceComplaintsScreenState
    extends State<DetailRegisteredPoliceComplaintsScreen> {
  DocumentSnapshot? currentdoc;
  @override
  Widget build(BuildContext context) {
    currentdoc ??=
        ModalRoute.of(context)!.settings.arguments as DocumentSnapshot<Object>?;
    return Scaffold(
      appBar: AppBar(
        title: Text("${currentdoc!.id}"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Container(
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(
                16.0,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 8.0,
                      bottom: 4.0,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "${currentdoc!["name"]}",
                          style: TextStyle(fontSize: 30.0),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4.0, bottom: 8.0),
                    child: Row(
                      children: [
                        Text(
                          "${currentdoc!["phoneNo"]}",
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4.0, bottom: 8.0),
                    child: Row(
                      children: [
                        Text(
                          "${currentdoc!["officerName"]}",
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4.0, bottom: 8.0),
                    child: Row(
                      children: [
                        Text(
                          "${currentdoc!["email"]}",
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4.0, bottom: 8.0),
                    child: Row(
                      children: [
                        Text(
                          "${currentdoc!["city"]}",
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4.0, bottom: 8.0),
                    child: Row(
                      children: [
                        Text(
                          "${currentdoc!["address"]}",
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4.0, bottom: 80.0),
                    child: Row(
                      children: [
                        Text(
                          "${currentdoc!["badgeNo"]}",
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 8.0,
                      bottom: 4.0,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Description",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4.0, bottom: 8.0),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 300,
                          child: Text(
                            "${currentdoc!["description"]}",
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.local_police)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // child:
        // Center(
        //   child: Column(
        //     children: [
        //       Text(
        //         "Name",
        //         style: TextStyle(
        //           fontSize: 20,
        //           color: Colors.black,
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        //       Text(
        //         "${currentdoc!["name"]}",
        //         style: TextStyle(
        //           fontSize: 20,
        //           color: Colors.black,
        //         ),
        //       ),
        //       SizedBox(
        //         height: 10,
        //       ),
        //       Text(
        //         "Phone Number",
        //         style: TextStyle(
        //           fontSize: 20,
        //           color: Colors.black,
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        //       Text(
        //         "${currentdoc!["phoneNo"]}",
        //         style: TextStyle(
        //           fontSize: 20,
        //           color: Colors.black,
        //         ),
        //       ),
        //       SizedBox(
        //         height: 10,
        //       ),
        //       Text(
        //         "Officer Name",
        //         style: TextStyle(
        //           fontSize: 20,
        //           color: Colors.black,
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        //       Text(
        //         "${currentdoc!["officerName"]}",
        //         style: TextStyle(
        //           fontSize: 20,
        //           color: Colors.black,
        //         ),
        //       ),
        //       SizedBox(
        //         height: 10,
        //       ),
        //       Text(
        //         "Email",
        //         style: TextStyle(
        //           fontSize: 20,
        //           color: Colors.black,
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        //       Text(
        //         "${currentdoc!["email"]}",
        //         style: TextStyle(
        //           fontSize: 20,
        //           color: Colors.black,
        //         ),
        //       ),
        //       SizedBox(
        //         height: 10,
        //       ),
        //       Text(
        //         "City",
        //         style: TextStyle(
        //           fontSize: 20,
        //           color: Colors.black,
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        //       Text(
        //         "${currentdoc!["city"]}",
        //         style: TextStyle(
        //           fontSize: 20,
        //           color: Colors.black,
        //         ),
        //       ),
        //       SizedBox(
        //         height: 10,
        //       ),
        //       Text(
        //         "Address",
        //         style: TextStyle(
        //           fontSize: 20,
        //           color: Colors.black,
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        //       Text(
        //         "${currentdoc!["address"]}",
        //         style: TextStyle(
        //           fontSize: 20,
        //           color: Colors.black,
        //         ),
        //       ),
        //       SizedBox(
        //         height: 10,
        //       ),
        //       Text(
        //         "Badge No",
        //         style: TextStyle(
        //           fontSize: 20,
        //           color: Colors.black,
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        //       Text(
        //         "${currentdoc!["badgeNo"]}",
        //         style: TextStyle(
        //           fontSize: 20,
        //           color: Colors.black,
        //         ),
        //       ),
        //       SizedBox(
        //         height: 10,
        //       ),
        //       Text(
        //         "Description",
        //         style: TextStyle(
        //           fontSize: 20,
        //           color: Colors.black,
        //           fontWeight: FontWeight.bold,
        //         ),
        //       ),
        //       Text(
        //         "${currentdoc!["description"]}",
        //         style: TextStyle(
        //           fontSize: 20,
        //           color: Colors.black,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
