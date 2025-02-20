import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final bool obsecureText;
  final TextEditingController controller;
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.obsecureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            labelText: labelText,
            labelStyle: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w400)),
        obscureText: obsecureText,
      ),
    );
  }
}
