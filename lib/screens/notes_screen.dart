import 'package:flutter/material.dart';
import 'package:note_app/widgets/action_appBar.dart';
import '../widgets/note_list_view.dart';
import '../widgets/show_model_bottom_sheet.dart';

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
        actions: const [
         ActionAppBar()
        ],
      ),
      body:  const Column(
        children: [
         Expanded(child: NotesListView())
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
        showModalBottomSheet(context: context, builder: (context) {return const ShowModelSheet(); },);
      }, child: const Icon(Icons.add,)),
    );
  }
}

