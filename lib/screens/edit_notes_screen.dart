import 'package:flutter/material.dart';
import 'package:note_app/cubit/notes/notes_cubit.dart';
import 'package:note_app/widgets/action_appBar.dart';
import 'package:note_app/widgets/custom_text_form_filed.dart';

import '../model/note_model.dart';

class EditNotesScreen extends StatefulWidget {
  const EditNotesScreen({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNotesScreen> createState() => _EditNotesScreenState();
}

class _EditNotesScreenState extends State<EditNotesScreen> {
  var titleController = TextEditingController();
  var contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 150,
        leading: const Padding(
          padding: EdgeInsetsDirectional.only(start: 24, top: 6),
          child: Text(
            'Edit Note',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ),
        actions: [
          ActionAppBar(
            button: Icons.check,
            onTap: () {
              if(titleController.text == '' ){
                widget.note.title =  widget.note.title;

              }else{
                widget.note.title = titleController.text ;

              }

              if( contentController.text == ''){
                widget.note.content =  widget.note.content;

              }else{
                widget.note.content = contentController.text ;

              }

              widget.note.save();
              NotesCubit.get(context).getAllNotes();
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsetsDirectional.only(start: 24, end: 24, top: 32),
            child:
                CustomTextFormFiled(hint: 'Title', controller: titleController),
          ),
          Padding(
            padding:
                const EdgeInsetsDirectional.only(start: 24, end: 24, top: 32),
            child: CustomTextFormFiled(
                hint: 'content', maxLines: 5, controller: contentController),
          ),
        ],
      ),
    );
  }
}
