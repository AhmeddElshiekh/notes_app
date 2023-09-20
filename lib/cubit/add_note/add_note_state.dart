part of 'add_note_cubit.dart';

@immutable
abstract class AddNoteStates {}

class AddNoteInitial extends AddNoteStates {}
class AddNoteLoadingState extends AddNoteStates {}
class AddNoteSuccessfulState extends AddNoteStates {}
class AddNoteErrorState extends AddNoteStates {}

