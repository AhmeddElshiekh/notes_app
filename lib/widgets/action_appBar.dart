import 'package:flutter/material.dart';

class ActionAppBar extends StatelessWidget {
  const ActionAppBar({super.key, required this.button, this.onTap});
  final IconData button;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsetsDirectional.only(end: 24),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(10),
              color: Colors.grey.withOpacity(.3)
          ),
          child:  Icon(button,size: 28,),
        ),
      ),
    );
  }
}
