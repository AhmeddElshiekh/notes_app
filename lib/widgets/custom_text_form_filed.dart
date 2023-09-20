import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({super.key,  this.maxLines, required this.hint, this.onValidate, this.controller});
  final int? maxLines;
  final String hint;
  final String? Function(String?)? onValidate;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
        border:  const OutlineInputBorder(
        ),
      ),
      maxLines: maxLines,
      validator: onValidate,
      controller:controller ,
    );
  }
}
