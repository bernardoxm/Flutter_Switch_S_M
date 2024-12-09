import 'package:flutter/material.dart';
import 'package:problema/pages/my_home_page.dart';
import 'package:problema/presentation/controllers/theme_controller.dart';


void main() {
  runApp(const MyApp());
}

final themeController = ThemeController();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: themeController,
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: themeController.value
              ? ThemeData.dark()
              : ThemeData.light(),
          home: const MyHomePage(),
        );
      },
    );
  }
}

