import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(8),
          color: Colors.deepPurple,

        ),
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: Center(child: Text(text,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)),
      ),
    );
  }
}
