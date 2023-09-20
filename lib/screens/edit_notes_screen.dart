import 'package:flutter/material.dart';
import 'package:note_app/widgets/action_appBar.dart';
import 'package:note_app/widgets/custom_text_form_filed.dart';

class EditNotesScreen extends StatelessWidget {
  const EditNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth:150 ,
        leading: const Padding(
          padding: EdgeInsetsDirectional.only(start: 24,top: 6),
          child: Text('Edit Note',style: TextStyle(
              color: Colors.white,
              fontSize: 30
          ),),
        ),
        actions: const [
          ActionAppBar(button: Icons.check,)
        ],
      ),
      body:  const Column(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(start: 24,end: 24,top: 32),
            child: CustomTextFormFiled(hint: 'Title'),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 24,end: 24,top: 32),
            child: CustomTextFormFiled(hint: 'content',maxLines: 5,),
          ),
        ],
      ),
    );
  }
}

