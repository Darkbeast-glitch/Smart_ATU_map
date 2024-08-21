import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {Key? key,
      required this.hintText,
      required this.icon,
      required this.obscureText})
      : super(key: key);
  final String hintText;
  final IconData icon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        obscureText: obscureText,
        // Suggested code may be subject to a license. Learn more: ~LicenseLog:1955697008.
        // Suggested code may be subject to a license. Learn more: ~LicenseLog:2225755.
        decoration: InputDecoration(
          // Suggested code may be subject to a license. Learn more: ~LicenseLog:24986859.
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500]),
          prefixIcon: Icon(
            icon,
            color: Colors.grey[500],
          ),
        ),
      ),
    );
  }
}
