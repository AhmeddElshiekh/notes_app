
import 'package:flutter/material.dart';
import 'package:note_app/widgets/color_list_view.dart';

import '../constant.dart';
import '../model/note_model.dart';

class EditNoteColorListView extends StatefulWidget {
  const EditNoteColorListView({super.key, required this.note});
  final NoteModel note;
  @override
  State<EditNoteColorListView> createState() => _EditNoteColorListViewState();
}

class _EditNoteColorListViewState extends State<EditNoteColorListView> {


  late int currentIndex ;
  @override
  void initState() {
    currentIndex = kColors.indexOf(Color(widget.note.color));
    super.initState();
  }
  @override

  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: kColors.length,
        itemBuilder: (context, index) =>  GestureDetector(
          onTap: (){
            currentIndex = index;
            widget.note.color = kColors[index].value;
            setState(() {});
          },
          child: ColorItem(
            color: kColors[index],
            isActive: currentIndex == index,
          ),
        ),),
    );
  }
}




