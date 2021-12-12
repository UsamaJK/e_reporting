import 'dart:ffi';

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  late final IconData icon;
  late final String hint;
  late final TextEditingController controller;
  late final String label;
  late final bool obscureText;
  TextInputType textInputType;
  final String Function(String? value) onvalidate;
  // final void Function() onsaved;

  CustomTextField({
    required this.icon,
    required this.hint,
    required this.controller,
    required this.label,
    this.obscureText = false,
    required this.textInputType,
    required this.onvalidate,
    // required this.onsaved,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: textInputType,
      autofocus: false,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.account_circle,
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "First Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      // onSaved: onSaved,
      validator: onvalidate,
    );
  }
}
