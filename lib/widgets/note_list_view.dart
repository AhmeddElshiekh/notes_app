import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubit/notes/notes_cubit.dart';
import 'package:note_app/model/note_model.dart';

import 'note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NoteStates>(
      builder: (context, state) {
        List<NoteModel> notes = NotesCubit.get(context).notes ;
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: ListView.builder(
            itemCount:notes.length,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) =>  NoteItem(note:notes[index],),),
        );
      },
    );
  }
}
