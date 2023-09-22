import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:note_app/constant.dart';
import 'package:note_app/model/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NoteStates> {
  NotesCubit() : super(AddNoteInitial());
  static NotesCubit get(context) => BlocProvider.of(context);

  Color? color  ;
  addNote(NoteModel model)async{
    model.color = color!.value;
    emit(AddNoteLoadingState());
   var notesBox= Hive.box<NoteModel>(kNoteBox);
   await notesBox.add(model).then((value) {
     emit(AddNoteSuccessfulState());
   }).catchError((error){
     print('error when add note $error');
     emit(AddNoteErrorState());
   });
  }

  editNote(NoteModel model){
    model.color = color!.value;
    model.save();
    emit(AddNoteSuccessfulState());

  }

  List<NoteModel> notes = [];
  getAllNotes() {
    var notesBox = Hive.box<NoteModel>(kNoteBox);
    notes = notesBox.values.toList();
    emit(GetAllNotesSuccessfulState());
  }


}
