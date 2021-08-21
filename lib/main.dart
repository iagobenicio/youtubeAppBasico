import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';



Future main() async{
  await dotenv.load(fileName: ".env");
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.dark,
      visualDensity: VisualDensity.adaptivePlatformDensity
    ),
    home: Home(),
  ));
}
