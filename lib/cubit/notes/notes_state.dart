part of 'notes_cubit.dart';

@immutable
abstract class NoteStates {}

class AddNoteInitial extends NoteStates {}
class AddNoteLoadingState extends NoteStates {}
class AddNoteSuccessfulState extends NoteStates {}
class AddNoteErrorState extends NoteStates {}


class GetAllNotesSuccessfulState extends NoteStates {}


