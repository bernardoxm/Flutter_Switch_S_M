import 'package:flutter/material.dart';
import 'package:problema/presentation/controllers/theme_controller.dart';
import 'package:flutter_switch/flutter_switch.dart';

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
          theme: themeController.isDarkTheme
              ? ThemeData.dark()
              : ThemeData.light(),
          home: const MyHomePage(),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('meu app'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('trocar tema do app'),
            ListenableBuilder(
                listenable: themeController,
                builder: (context, child) {
                  return FlutterSwitch(
                    value: themeController.isDarkTheme,
                    onToggle: (val) {
                      themeController.toggleTheme();
                    },
                    width: 130.0,
                    height: 60.0,
                    toggleSize: 60.0,
                    activeColor: Colors.blueGrey,
                    inactiveColor: const Color.fromARGB(255, 251, 192, 45),
                    activeIcon: Image.asset('assets/icons/lua.png'),
                    inactiveIcon: Image.asset('assets/icons/sol.png'),
                    borderRadius: 30.0,
                    
                    toggleColor: themeController.isDarkTheme ? Colors.blueGrey :  const Color.fromARGB(255, 251, 192, 45),
                    activeText:    'Dark',
                    inactiveText:  'Light',
                  );
                }),
          ],
        ),
      ),
    );
  }
}
