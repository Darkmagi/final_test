import 'package:final_test/test1/test_1_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.redAccent[700],
            accentColor: Colors.blue[500],
            floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Theme.of(context).primaryColor)),
        home: Test1Page());
  }
}
