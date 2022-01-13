// import 'dart:js';

import 'package:achievement_view/achievement_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_reporting/models/emergencyFirebase.dart';
import 'package:e_reporting/models/firebase.dart';
import 'package:e_reporting/models/user_model.dart';
import 'package:e_reporting/screens/dashboard_screen.dart';
import 'package:e_reporting/screens/home_screen.dart';
import 'package:e_reporting/widgets/app_drawer.dart';
import 'package:e_reporting/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EmergencyReportingScreen extends StatefulWidget {
  static const String routeName = "/EmergencyReportingScreen";

  const EmergencyReportingScreen({Key? key}) : super(key: key);

  @override
  _EmergencyReportingScreenState createState() =>
      _EmergencyReportingScreenState();
}

class _EmergencyReportingScreenState extends State<EmergencyReportingScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController controllerFirstName = TextEditingController();
  TextEditingController controllerLastName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerAddress = TextEditingController();
  TextEditingController controllerCNIC = TextEditingController();
  TextEditingController controllerCity = TextEditingController();
  TextEditingController controllerDescription = TextEditingController();
  String? _currentSelectedValue;
  String? _currentSelectedValueOccupation;
  String? _currentSelectedValueCrimeCategories;
  String? pronoun = "";
  String? occupation = "";
  String? crimeCategories = "";
  // User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  var _pronouns = [
    "Male",
    "Female",
    "Other",
    "N/A",
  ];

  var _crimeCategories = [
    "Cybercrime",
    "Fraud",
    "Theft",
    "Assault",
    "Terrorist Attack",
    "Drug Trafficking",
    "Ransom",
  ];

  var _occupations = [
    "Student",
    "Govt. Employee",
    "Army Officer",
    "Judiciary",
    "Embassy",
    "Doctor",
    "Professor/ Lecturer/ Teacher",
    "Lawyer",
    "Banker",
    "Businessman",
    "Politician",
    "Show Business",
    "Housewife",
    "Journalist",
    "Landlord/ Agriculturist",
    "NGO",
    "Retired Officer/ Pensioner",
    "Private Job",
    "Others",
  ];

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    final firstNameField = TextFormField(
      autofocus: false,
      controller: controllerFirstName,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("First Name cannot be Empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter Valid name(Min. 3 Character)");
        }
        return null;
      },
      onSaved: (value) {
        controllerFirstName.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.account_circle,
        ),
        // contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "First Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );

    final lastNameField = TextFormField(
      autofocus: false,
      controller: controllerLastName,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Last Name cannot be Empty");
        }
        return null;
      },
      onSaved: (value) {
        controllerLastName.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.account_circle,
        ),
        // contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Last Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );

    final emailField = TextFormField(
      autofocus: false,
      controller: controllerEmail,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please enter a valid email");
        }
        return null;
      },
      onSaved: (value) {
        controllerEmail.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.mail,
        ),
        // contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );

    final phoneNumberField = TextFormField(
      autofocus: false,
      controller: controllerPhone,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      validator: (value) {
        if (value!.isEmpty) {
          return ("Phone number cannot be Empty");
        }
        return null;
      },
      onSaved: (value) {
        controllerPhone.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.phone,
        ),
        // contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Phone Number",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );

    final cityField = TextFormField(
      autofocus: false,
      controller: controllerCity,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("First Name cannot be Empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter Valid name(Min. 3 Character)");
        }
        return null;
      },
      onSaved: (value) {
        controllerCity.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.location_city,
        ),
        // contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "City",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );

    final cnicField = TextFormField(
      autofocus: false,
      controller: controllerCNIC,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      validator: (value) {
        if (value!.isEmpty) {
          return ("CNIC cannot be Empty");
        }
        return null;
      },
      onSaved: (value) {
        controllerCNIC.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.perm_identity,
        ),
        // contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "CNIC",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );

    final addressField = TextFormField(
      autofocus: false,
      controller: controllerAddress,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Address cannot be Empty");
        }
        return null;
      },
      onSaved: (value) {
        controllerAddress.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.location_city,
        ),
        // contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Address",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );

    final descriptionField = TextFormField(
      // maxLines: 4,
      maxLines: 3,

      autofocus: false,
      controller: controllerDescription,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Description cannot be Empty");
        }
        return null;
      },
      onSaved: (value) {
        controllerDescription.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.description,
        ),
        // contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        // contentPadding: EdgeInsets.symmetric(vertical: 50, horizontal: 50),
        hintText: "Description",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );

    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.redAccent,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            if (await emergencyReportSetup(
              firstName: controllerFirstName.text,
              lastName: controllerLastName.text,
              email: controllerEmail.text,
              phoneNumber: controllerPhone.text,
              gender: pronoun!,
              city: controllerCity.text,
              cnic: controllerCNIC.text,
              address: controllerAddress.text,
              occupation: occupation!,
              category: crimeCategories!,
              description: controllerDescription.text,
            )) {
              print("SHOW ERROR MESSAGE");
            }

            // show();
            print("NAVIGATION IS HERE");
            Navigator.of(context).pushNamed(HomeScreen.routeName);
            show();
          }
        },
        child: const Text(
          "Register",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    return Scaffold(
      // drawer: AppDrawer(),
      appBar: AppBar(
        title: Text("Complaint Registration"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 40.0,
                    bottom: 35,
                  ),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Personal Information",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: firstNameField,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: lastNameField,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                emailField,
                SizedBox(
                  height: 20,
                ),
                phoneNumberField,

                // onTap: () {
                //   showDatePicker(
                //     context: context,
                //     initialDate: DateTime.now(),
                //     firstDate: DateTime(2001),
                //     lastDate: DateTime(2222),
                //   ).then((date) {
                //     setState(() {
                //       dateOfBirth = date;
                //     });
                //   });
                // },
                // InkWell(
                //   onTap: () {
                //     showDatePicker(
                //       context: context,
                //       initialDate: DateTime.now(),
                //       firstDate: DateTime(2001),
                //       lastDate: DateTime(2222),
                //     ).then((date) {
                //       setState(() {
                //         dateOfBirth = date;
                //       });
                //     });
                //   },
                //   child: CustomTextField(
                //     label: dateOfBirth == null
                //         ? "DOB (MM/DD/YY)"
                //         : dateOfBirth.toString(),
                //     icon: Icons.date_range,
                //     controller: controllerDOB,
                //   ),
                // ),

                SizedBox(
                  height: 20,
                ),
                FormField<String>(
                  validator: (value) {
                    value != null && value.isEmpty
                        ? 'Please select a gender'
                        : null;
                  },
                  builder: (FormFieldState<String> state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        labelText: "Select Genger",
                        hintText: "Gender",
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            25,
                          ),
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      isEmpty: _currentSelectedValue == '',
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: _currentSelectedValue,
                        isDense: true,
                        onChanged: (newValue) {
                          setState(() {
                            _currentSelectedValue = newValue;
                            state.didChange(newValue);
                            pronoun = _currentSelectedValue;
                            print("GENDER IS ${pronoun}");
                          });
                        },
                        items: _pronouns.map((String value) {
                          return DropdownMenuItem<String>(
                            child: Text(value),
                            value: value,
                          );
                        }).toList(),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 20,
                ),

                cityField,

                SizedBox(
                  height: 20,
                ),
                cnicField,

                SizedBox(
                  height: 20,
                ),
                addressField,

                SizedBox(
                  height: 20,
                ),

                FormField<String>(
                  builder: (FormFieldState<String> state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        labelText: "Select Occupation",
                        hintText: "Occupation",
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            25,
                          ),
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      isEmpty: _currentSelectedValueOccupation == '',
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: _currentSelectedValueOccupation,
                        isDense: true,
                        onChanged: (newValue) {
                          setState(() {
                            _currentSelectedValueOccupation = newValue;
                            state.didChange(newValue);
                            occupation = _currentSelectedValueOccupation;
                            print("Occupation IS ${occupation}");
                          });
                        },
                        items: _occupations.map((String value) {
                          return DropdownMenuItem<String>(
                            child: Text(value),
                            value: value,
                          );
                        }).toList(),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 20,
                ),

                FormField<String>(
                  builder: (FormFieldState<String> state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                        labelText: "Select Crime Categories",
                        hintText: "Crime Categories",
                        prefixIcon: Icon(Icons.category),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            25,
                          ),
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      isEmpty: _currentSelectedValueCrimeCategories == '',
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: _currentSelectedValueCrimeCategories,
                        isDense: true,
                        onChanged: (newValue) {
                          setState(() {
                            _currentSelectedValueCrimeCategories = newValue;
                            state.didChange(newValue);
                            crimeCategories =
                                _currentSelectedValueCrimeCategories;
                            print("Occupation IS ${crimeCategories}");
                          });
                        },
                        items: _crimeCategories.map((String value) {
                          return DropdownMenuItem<String>(
                            child: Text(value),
                            value: value,
                          );
                        }).toList(),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                descriptionField,
                // CustomTextField(
                //   label: "Delievery Instruction",
                //   icon: Icons.email,
                //   controller: controllerDescription,
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //     top: 15.0,
                //     bottom: 50,
                //   ),
                //   child: CustomButton(
                //     onPressed: () async {
                //       user.firstName = controllerFirstName.text;
                //       user.lastName = controllerLastName.text;
                //       user.email = controllerEmail.text;
                //       user.phone = controllerPhone.text;
                //       user.address = controllerAddress.text;
                //       user.streetNumber = controllerCNIC.text;
                //       user.streetAddress = controllerStreetAddress.text;
                //       user.unitNumber = controllerUnitNumber.text;
                //       user.postalCode = controllerPostalCode.text;
                //       user.city = controllerCity.text;
                //       user.province = controllerProvince.text;
                //       Navigator.of(context).pushNamed(
                //         RegistrationScreen2.routeName,
                //       );
                //     },
                //     text: "Next",
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15.0,
                    bottom: 50,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          onPressed: () async {
                            {
                              Navigator.pop(context);
                            }
                          },
                          text: "Back",
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: signUpButton,

                        //   CustomButton(
                        //     onPressed: () async {
                        //       {
                        //         if (await userSetup(
                        //           firstName: controllerFirstName.text,
                        //           lastName: controllerLastName.text,
                        //           email: controllerEmail.text,
                        //           phoneNumber: controllerPhone.text,
                        //           gender: pronoun!,
                        //           city: controllerCity.text,
                        //           cnic: controllerCNIC.text,
                        //           address: controllerAddress.text,
                        //           occupation: occupation!,
                        //           category: crimeCategories!,
                        //           description: controllerDescription.text,
                        //         )) {
                        //           print("SHOW ERROR MESSAGE");
                        //           return;
                        //         }
                        //         Navigator.of(context).pushReplacement(
                        //             MaterialPageRoute(
                        //                 builder: (context) => DashboardScreen()));

                        //         // Navigator.of(context)
                        //         //     .pushNamed(ProductsOverviewScreen.routeName);
                        //         // show();
                        //       }
                        //     },
                        //     text: "Register",
                        //   ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void show() {
    AchievementView(
      context,
      title: 'Congratulations!!',
      subTitle: 'you successfully Regsitered the complaint',
      icon: Icon(
        Icons.insert_emoticon,
        size: 20,
        color: Colors.black,
      ),
      listener: (status) {
        print("Done");
      },
      elevation: 10,
      isCircle: true,
      borderRadius: 1,
      textStyleTitle: TextStyle(
        fontSize: 20,
        color: Colors.black,
      ),
      textStyleSubTitle: TextStyle(
        fontSize: 20,
        color: Colors.black,
      ),
      color: Colors.amber[600],
    )..show();
  }
}
