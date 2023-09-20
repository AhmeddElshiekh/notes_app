import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/cubit/bloc_observer.dart';
import 'package:note_app/screens/notes_screen.dart';

void main()async {
  await Hive.initFlutter();
  await Hive.openBox('note_box');
  Bloc.observer =  MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        fontFamily: 'Poppins'
      ),
      debugShowCheckedModeBanner: false,
      home: const NotesScreen(),
    );
  }
}