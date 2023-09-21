import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/widgets/color_list_view.dart';
import 'package:note_app/widgets/custom_button.dart';
import 'package:note_app/widgets/custom_text_form_filed.dart';

import '../cubit/notes/notes_cubit.dart';

class ShowModelSheet extends StatelessWidget {
  const ShowModelSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NoteStates>(
      listener: (context, state) {
        if(state is AddNoteSuccessfulState){
          NotesCubit.get(context).getAllNotes();
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is AddNoteLoadingState ? true : false,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const AddNoteForm(),
            ),
          ),
        );
      },
    );
  }
}

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  var titleController = TextEditingController();
  var contentController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: BlocBuilder<NotesCubit, NoteStates>(
        builder: (context, state) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(
                    start: 16, end: 16, top: 32),
                child: CustomTextFormFiled(
                    hint: 'Title',
                    controller: titleController,
                    onValidate: (val) {
                      if (val?.isEmpty ?? true) {
                        return 'please enter a title';
                      }
                      return null;
                    }),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                    start: 16, end: 16, top: 32),
                child: CustomTextFormFiled(
                    hint: 'content',
                    maxLines: 5,
                    controller: contentController,
                    onValidate: (val) {
                      if (val?.isEmpty ?? true) {
                        return 'please enter a content';
                      }
                      return null;
                    }),
              ),
              const SizedBox(height: 32,),
              const ColorListView(),

              Padding(
                  padding: const EdgeInsetsDirectional.only(
                      start: 16, end: 16, top: 32),
                  child: ConditionalBuilder(
                      condition: state is! AddNoteLoadingState,
                      builder: (context) => CustomButton(
                          text: 'Add',
                          onTap: () {
                            final now = DateTime.now();
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              var noteModel = NoteModel(
                                  title: titleController.text,
                                  content: contentController.text,
                                  date: DateFormat.yMMMMd('en_US')
                                      .format(now)
                                      .toString(),
                                  color: Colors.blue.value);
                              BlocProvider.of<NotesCubit>(context)
                                  .addNote(noteModel);
                            }
                          }),
                      fallback: (context) => const Center(
                            child: CircularProgressIndicator(),
                          ))),
              const SizedBox(
                height: 20,
              ),
            ],
          );
        },
      ),
    );
  }
}

