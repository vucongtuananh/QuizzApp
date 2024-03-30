import 'package:flutter/material.dart';
import 'package:quizz_app/core/constant/color_value.dart';
import 'package:quizz_app/features/calendar/presentation/pages/calendar_page.dart';
import 'package:quizz_app/features/create/presentation/pages/create_page.dart';
import 'package:quizz_app/features/home/presentation/pages/home_page.dart';
import 'package:quizz_app/features/library/presentation/pages/library_page.dart';
import 'package:quizz_app/features/traning/presentation/pages/training_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> _screen = [
    const HomePage(),
    const LibraryPage(),
    const CalendarPage(),
    const CreatePage(),
    const TrainingPage(),
  ];

  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: mainColor,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.book)),
            label: 'Library',
          ),
          NavigationDestination(
            icon: Badge(
              label: Text('2'),
              child: Icon(Icons.calendar_month),
            ),
            label: 'Messages',
          ),
          NavigationDestination(
            icon: Badge(
              label: Text('2'),
              child: Icon(Icons.add),
            ),
            label: 'Messages',
          ),
          NavigationDestination(
            icon: Badge(
              label: Text('2'),
              child: Icon(Icons.music_note_sharp),
            ),
            label: 'Messages',
          ),
        ],
      ),
      body: _screen[currentPageIndex],
    );
  }
}
