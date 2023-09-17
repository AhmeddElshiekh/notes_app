import 'package:flutter/material.dart';
import 'package:note_app/screens/notes_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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