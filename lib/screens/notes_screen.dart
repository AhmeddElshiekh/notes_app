import 'package:flutter/material.dart';
import 'package:note_app/widgets/note_item.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth:150 ,
        leading: const Padding(
          padding: EdgeInsetsDirectional.only(start: 24,top: 6),
          child: Text('Notes',style: TextStyle(
            color: Colors.white,
            fontSize: 30
          ),),
        ),
        actions: [
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 24),
            child: Container(
              height: 45,
               width: 45,
               decoration: BoxDecoration(
                 borderRadius: BorderRadiusDirectional.circular(10),
                 color: Colors.grey.withOpacity(.3)
               ),
              child: const Icon(Icons.search,size: 28,),
            ),
          )
        ],
      ),
      body:  const Column(
        children: [
         NoteItem()
        ],
      ),
    );
  }
}
