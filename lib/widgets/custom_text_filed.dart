import 'package:flutter/material.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled({super.key,  this.maxLines, required this.hint});
  final int? maxLines;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        border:  const OutlineInputBorder(
        ),
      ),
      maxLines: maxLines,
    );
  }
}
