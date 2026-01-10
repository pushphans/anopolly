import 'package:anopolly/Core/Constants/app_colors.dart';
import 'package:flutter/material.dart';

class MyTextformfield extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  const MyTextformfield({
    super.key,
    required this.controller,
    required this.label,
  });

  @override
  State<MyTextformfield> createState() => _MyTextformfieldState();
}

class _MyTextformfieldState extends State<MyTextformfield> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Email is required";
        }

        if (!value.contains("@gmail.com")) {
          return "Enter a valid email";
        }

        return null;
      },
      controller: widget.controller,
      decoration: InputDecoration(
        label: Text(widget.label, style: TextStyle(color: AppColors.blue)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.blue),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.blue),
        ),

        fillColor: AppColors.white,
        filled: true,
      ),
    );
  }
}
