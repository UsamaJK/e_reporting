import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_reporting/models/user_model.dart';
import 'package:e_reporting/screens/home_screen.dart';
import 'package:e_reporting/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardScreen extends StatefulWidget {
  static const String routeName = "/DashboardScreen";

  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<GDPData>? _chartData;

  TooltipBehavior? _tooltipBehavior;
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  var complaintlenght;

  @override
  void initState() {
    // _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
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
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text("Dashboard"),
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
          complaintlenght = listDocs.length;
          print(complaintlenght);

          return FutureBuilder<List<GDPData>>(
              future: getChartData(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                _chartData = snapshot.data;
                return SfCircularChart(
                  title: ChartTitle(text: "Registered Complaint\nComparison"),
                  legend: Legend(
                      isVisible: true,
                      overflowMode: LegendItemOverflowMode.wrap),
                  tooltipBehavior: _tooltipBehavior,
                  series: <CircularSeries>[
                    PieSeries<GDPData, String>(
                      dataSource: _chartData,
                      xValueMapper: (GDPData data, _) => data.continent,
                      yValueMapper: (GDPData data, _) => data.gdp,
                      dataLabelSettings: DataLabelSettings(
                        isVisible: true,
                      ),
                      enableTooltip: true,
                    ),
                  ],
                );
              });
          // body: Center(
          //   child: Padding(
          //     padding: EdgeInsets.all(20),
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: <Widget>[
          //         SizedBox(
          //           height: 150,
          //         ),
          //         Text(
          //           "Welcome Back",
          //           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          //         ),
          //         SizedBox(
          //           height: 10,
          //         ),
          //         Text(
          //           "${loggedInUser.firstName} ${loggedInUser.lastName}",
          //           style: TextStyle(
          //             color: Colors.black54,
          //             fontWeight: FontWeight.w500,
          //           ),
          //         ),
          //         Text(
          //           "${loggedInUser.email}",
          //           style: TextStyle(
          //             color: Colors.black54,
          //             fontWeight: FontWeight.w500,
          //           ),
          //         ),
          //         SizedBox(
          //           height: 15,
          //         ),
          //         ActionChip(
          //             label: Text("Logout"),
          //             onPressed: () {
          //               logout(context);
          //             })
          //       ],
          //     ),
          //   ),
          // ),
        },
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
  }
}

Future<List<GDPData>> getChartData() async {
  var simpleReportsSnapshot =
      await FirebaseFirestore.instance.collection("simpleReports").get();
  var policeReportsSnapshot =
      await FirebaseFirestore.instance.collection("policeReports").get();
  var emergencyReportSnapshot =
      await FirebaseFirestore.instance.collection("emergencyReporting").get();

  final List<GDPData> chartData = [
    GDPData('Simple Reports', simpleReportsSnapshot.docs.length),
    GDPData("Reports against Police", policeReportsSnapshot.docs.length),
    GDPData("Emergency Reports", emergencyReportSnapshot.docs.length),
  ];
  return chartData;
}

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final int gdp;
}
