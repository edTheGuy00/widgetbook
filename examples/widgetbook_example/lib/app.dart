import 'package:flutter/material.dart';
import 'package:meal_app/themes/dark_theme.dart';
import 'package:meal_app/widgets/dashboard.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal App',
      theme: getDarkTheme(context),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Meals'),
        ),
        body: Dashboard(),
      ),
    );
  }
}
