import 'package:flutter/material.dart';

import 'Widgets/ButtonWidget.dart';
import 'Widgets/ScreenWidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Calculator',
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          textButtonTheme: const TextButtonThemeData(
              style: ButtonStyle(
                  splashFactory: NoSplash.splashFactory,
                  textStyle:
                      MaterialStatePropertyAll(TextStyle(fontSize: 22)))),
          textSelectionTheme: const TextSelectionThemeData(
              selectionHandleColor: Colors.transparent)),
      home: const Screen(),
    );
  }
}

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: OrientationBuilder(builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return Column(
              children: [const ScreenWidget(), ButtonWidget()],
            );
          }
          return Row(
            children: [const ScreenWidget(), ButtonWidget()],
          );
        }),
      ),
    );
  }
}
