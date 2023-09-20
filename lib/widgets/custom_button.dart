import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, this.onTap});
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
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
