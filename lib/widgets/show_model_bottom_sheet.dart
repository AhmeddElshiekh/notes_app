import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_button.dart';
import 'package:note_app/widgets/custom_text_form_filed.dart';

class ShowModelSheet extends StatelessWidget {
  const ShowModelSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: AddNoteForm(),
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
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsetsDirectional.only(start: 16, end: 16, top: 32),
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
            padding: const EdgeInsetsDirectional.only(start: 16, end: 16, top: 32),
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
          const SizedBox(
            height: 100,
          ),
           Padding(
            padding: const EdgeInsetsDirectional.only(start: 16, end: 16, top: 32),
            child: CustomButton(text: 'Add',onTap: (){
              if(formKey.currentState!.validate()){
                formKey.currentState!.save();
              }
            }),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
