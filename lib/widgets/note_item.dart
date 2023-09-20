import 'package:flutter/material.dart';
import 'package:note_app/model/note_model.dart';
import 'package:note_app/screens/edit_notes_screen.dart';

import '../cubit/notes/notes_cubit.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 8),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) =>  EditNotesScreen(note:  note,),));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(10),
            color: Colors.grey,

          ),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title:  Padding(
                  padding: const EdgeInsetsDirectional.only(top: 44),
                  child: Text(note.title,style: const TextStyle(
                      fontSize: 24,
                      color: Colors.black
                  ),),
                ),
                subtitle:  Padding(
                  padding:const EdgeInsetsDirectional.only(top: 18,bottom: 24,),
                  child: Text(note.content,style: TextStyle(
                      fontSize: 18,
                      color: Colors.black.withOpacity(.4)
                  ),),
                ),
                trailing: IconButton(onPressed: ()async{
                  await note.delete().then((value){
                    NotesCubit.get(context).getAllNotes();
                  });

                }, icon: const Icon(Icons.delete,size: 30,color: Colors.black,)),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(bottom: 44,end: 28),
                child: Text(note.date,style: TextStyle(color: Colors.black.withOpacity(.4)),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
