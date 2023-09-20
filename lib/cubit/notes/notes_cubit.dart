import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:note_app/constant.dart';
import 'package:note_app/model/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NoteStates> {
  NotesCubit() : super(AddNoteInitial());
  static NotesCubit get(context) => BlocProvider.of(context);

  addNote(NoteModel model)async{
    emit(AddNoteLoadingState());
   var notesBox= Hive.box<NoteModel>(kNoteBox);
   await notesBox.add(model).then((value) {
     emit(AddNoteSuccessfulState());
   }).catchError((error){
     print('error when add note $error');
     emit(AddNoteErrorState());
   });
  }

  List<NoteModel> notes = [];
  getAllNotes() {
    var notesBox = Hive.box<NoteModel>(kNoteBox);
    notes = notesBox.values.toList();
  }

}
