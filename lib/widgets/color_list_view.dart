

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/constant.dart';
import 'package:note_app/cubit/notes/notes_cubit.dart';

class ColorListView extends StatefulWidget {
  const ColorListView({super.key});

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {


  late int currentIndex  ;

  @override
  void initState() {
    currentIndex  = kColors.indexOf(BlocProvider.of<NotesCubit>(context).color!);
    super.initState();
  }

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
              BlocProvider.of<NotesCubit>(context).color = kColors[index];
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


class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.color, required this.isActive});


   final Color color ;

   final bool isActive  ;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 4),
      child: isActive  ?  Stack(
        alignment: Alignment.center,
        children: [
          CircleAvatar(
            radius: 43,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 35,
              backgroundColor: color,
            ),
          ),
          const Icon(Icons.check,size: 35,),
        ],
      ) :  CircleAvatar(
        radius: 40,
        backgroundColor: color,
      ),
    );
  }
}

