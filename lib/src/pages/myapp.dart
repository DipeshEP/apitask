import 'package:apitask/src/pages/homepage.dart';
import 'package:flutter/material.dart';
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restapi',
      theme: ThemeData(

        primarySwatch: Colors.pink,

      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}