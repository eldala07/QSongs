import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:q_songs/screens/qrCodeScreens/generate.dart';
import 'package:q_songs/screens/queueScreen/components/app_bar_queue_screen.dart';
import 'package:q_songs/screens/queueScreen/queue_screen.dart';
import 'package:q_songs/screens/qrCodeScreens/scan.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Q-Songs',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: DateTime.now().hour > 17 ? 'Good evening' : 'Good afternoon'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 1;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 12, color: Colors.white);

  static List<Widget> widgetOptions = [
    Scan(),
    QueueScreen(),
    Text(
      'Index 1: Picture',
      style: optionStyle,
    ),
    Text(
      'Index 2: Search',
      style: optionStyle,
    ),
    Generate(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0xff0f17ad),
            Color(0xff6985e8),
          ],
          begin: FractionalOffset(0.0, 0.4),
          end: Alignment.topRight,
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBarQueueScreen(title: widget.title),
          body: Column(children: [
            Expanded(
              child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: widgetOptions.elementAt(_selectedIndex)),
            ),
          ]),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            backgroundColor: Color(0xcc000000),
            elevation: 0,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                backgroundColor: Color(0xcc000000),
                icon: Icon(Icons.camera),
                label: 'Scan',
              ),
              BottomNavigationBarItem(
                backgroundColor: Color(0xcc000000),
                icon: Icon(Icons.queue),
                label: 'Queue',
              ),
              BottomNavigationBarItem(
                backgroundColor: Color(0xcc000000),
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                backgroundColor: Color(0xcc000000),
                icon: Icon(Icons.image),
                label: 'Pictures',
              ),
              BottomNavigationBarItem(
                backgroundColor: Color(0xcc000000),
                icon: Icon(Icons.fiber_new),
                label: 'Generate',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.white,
            selectedFontSize: 12,
            unselectedItemColor: Colors.white70,
            onTap: _onItemTapped,
          ),
        ));
  }
}
