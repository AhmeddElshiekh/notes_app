import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(24.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(10),
          color: Colors.grey,

        ),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: const Padding(
                padding: EdgeInsetsDirectional.only(top: 24),
                child: Text('Flutter tips',style: TextStyle(
                    fontSize: 24,
                    color: Colors.black
                ),),
              ),
              subtitle:  Padding(
                padding:const EdgeInsetsDirectional.only(top: 18,end: 24),
                child: Text('Build your career with Tharwat Samy',style: TextStyle(
                    fontSize: 18,
                    color: Colors.black.withOpacity(.4)
                ),),
              ),
              trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.delete,size: 30,color: Colors.black,)),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 24,end: 28),
              child: Text('May 21,2022',style: TextStyle(color: Colors.black.withOpacity(.4)),),
            ),
          ],
        ),
      ),
    );
  }
}
