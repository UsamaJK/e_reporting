import 'package:e_reporting/screens/dashboard_screen.dart';
import 'package:e_reporting/screens/home_screen.dart';
import 'package:e_reporting/screens/registered_complaints.dart';
import 'package:e_reporting/screens/registered_policeComplaints.dart';
import 'package:e_reporting/screens/report_againstPoliceScreen.dart';
import 'package:e_reporting/screens/simple_reporting_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_reporting/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppDrawer extends StatefulWidget {
  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              title: Text("Hello ${loggedInUser.firstName}"),
              automaticallyImplyLeading: false,
            ),

            // ListTile(
            //   leading: Icon(Icons.shop),
            //   title: Text('Shop'),
            //   onTap: () {
            //     Navigator.of(context)
            //         .pushReplacementNamed(ProductsOverviewScreen.routeName);
            //   },
            // ),
            // Divider(),
            // ListTile(
            //   leading: Icon(Icons.payment),
            //   title: Text('Orders'),
            //   onTap: () {
            //     Navigator.of(context)
            //         .pushReplacementNamed(OrdersScreen.routeName);
            //   },
            // ),
            // Divider(),
            // ListTile(
            //   leading: Icon(Icons.person),
            //   title: Text('Profile'),
            //   onTap: () {
            //     Navigator.of(context)
            //         .pushReplacementNamed(UserProfileScreen.routeName);
            //   },
            // ),
            // Divider(),
            // ListTile(
            //   leading: Icon(Icons.question_answer),
            //   title: Text('FAQ'),
            //   onTap: () {
            //     Navigator.of(context)
            //         .pushReplacementNamed(UserProfileScreen.routeName);
            //   },
            // ),
            Divider(),
            ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  Navigator.of(context).pushNamed(DashboardScreen.routeName);
                }),
            Divider(),
            ListTile(
                leading: Icon(Icons.report),
                title: Text('Register Complaints'),
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(SimpleReportingScreen.routeName);
                }),
            Divider(),
            ListTile(
              leading: Icon(Icons.local_police),
              title: Text('Report Against Police'),
              onTap: () {
                Navigator.of(context)
                    .pushNamed(ReportAgainstPoliceScreen.routeName);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.report),
              title: Text('Complaints History'),
              onTap: () {
                Navigator.of(context).pushNamed(RegisteredComplaints.routeName);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.local_police),
              title: Text('Complaints Registered Against Police'),
              onTap: () {
                Navigator.of(context)
                    .pushNamed(RegisteredPoliceComplaints.routeName);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: const Text(
                "Log Out",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: "Lato",
                  fontSize: 20,
                  color: Colors.red,
                ),
              ),
              onTap: () {
                logout(context);
              },
            ),
            // Divider(),
            // ListTile(
            //   leading: Icon(Icons.logout),
            //   title: Text('Logout'),
            //   onTap: () {},
            // ),
          ],
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
  }
}
