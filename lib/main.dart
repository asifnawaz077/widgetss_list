import 'package:flutter/material.dart';
import 'package:widget_list/listviewbuilderclass.dart';
import 'package:widget_list/widgets_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Listviewbuilderclass(),
    );
  }
}
