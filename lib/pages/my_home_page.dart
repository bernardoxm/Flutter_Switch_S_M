import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:problema/main.dart';

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
                    value: themeController.value,
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
                    
                    toggleColor: themeController.value ? Colors.blueGrey :  const Color.fromARGB(255, 251, 192, 45),
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
