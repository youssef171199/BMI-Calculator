import 'package:bmi/home.dart';

import 'package:flutter/material.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        canvasColor: Colors.black,
        textTheme: const TextTheme(
          displayMedium: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                      ), 
        )
      ),
      home:const homepage(),
    ); 
  }
}
