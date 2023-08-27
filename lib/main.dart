import 'package:flutter/material.dart';
import 'package:gdsc/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      title: "Conferences",
      home: Scaffold(
        appBar: AppBar(title:const Text("Conferences"),),
        body: const HomePage(),
      ),
    );
  }
}
