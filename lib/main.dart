import 'package:flutter/material.dart';
import 'package:webingo_demo/Theme/colors.dart';
import 'package:webingo_demo/screens/navigationScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Constants.lightTheme,
      home: NavigationScreen(),
    );
  }
}
