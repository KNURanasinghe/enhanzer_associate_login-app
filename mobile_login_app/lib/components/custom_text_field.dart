import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final bool obsecureText;
  final TextEditingController controller;
  Widget? prefixIcon;
  CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.obsecureText,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white70,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            labelText: labelText,
            suffixIcon: prefixIcon,
            labelStyle: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w400)),
        obscureText: obsecureText,
      ),
    );
  }
}
