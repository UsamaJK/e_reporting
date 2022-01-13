// @dart=2.9
import 'package:e_reporting/screens/dashboard_screen.dart';
import 'package:e_reporting/screens/detail_registeredComplaintScreen.dart';
import 'package:e_reporting/screens/detail_registeredPoliceComplaintsScreen.dart';
import 'package:e_reporting/screens/emergency_reporting_screen.dart';
import 'package:e_reporting/screens/home_screen.dart';
import 'package:e_reporting/screens/registered_complaints.dart';
import 'package:e_reporting/screens/registered_policeComplaints.dart';
import 'package:e_reporting/screens/registration_screen.dart';
import 'package:e_reporting/screens/report_againstPoliceScreen.dart';
import 'package:e_reporting/screens/simple_reporting_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Reporting',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomeScreen(),
      routes: {
        HomeScreen.routeName: (ctx) => HomeScreen(),
        RegistrationScreen.routeName: (ctx) => RegistrationScreen(),
        DashboardScreen.routeName: (ctx) => DashboardScreen(),
        SimpleReportingScreen.routeName: (ctx) => SimpleReportingScreen(),
        RegisteredComplaints.routeName: (ctx) => RegisteredComplaints(),
        DetailRegisteredComplaintScreen.routeName: (ctx) =>
            DetailRegisteredComplaintScreen(),
        ReportAgainstPoliceScreen.routeName: (ctx) =>
            ReportAgainstPoliceScreen(),
        RegisteredPoliceComplaints.routeName: (ctx) =>
            RegisteredPoliceComplaints(),
        DetailRegisteredPoliceComplaintsScreen.routeName: (ctx) =>
            DetailRegisteredPoliceComplaintsScreen(),
        EmergencyReportingScreen.routeName: (ctx) => EmergencyReportingScreen(),
      },
    );
  }
}
