import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_button.dart';
import 'package:note_app/widgets/custom_text_filed.dart';

class ShowModelSheet extends StatelessWidget {
  const ShowModelSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return  const SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(start: 16,end: 16,top: 32),
            child: CustomTextFiled(hint: 'Title'),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 16,end: 16,top: 32),
            child: CustomTextFiled(hint: 'content',maxLines: 5,),
          ),
          SizedBox(height: 100,),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 16,end: 16,top: 32),
            child: CustomButton(text: 'Add'),
          ),
          SizedBox(height: 20,),

        ],
      ),
    );
  }
}
