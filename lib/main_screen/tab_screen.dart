import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quizz_app/core/constant/color_value.dart';
import 'package:quizz_app/core/constant/constant_value.dart';
import 'package:quizz_app/core/di/app_di.dart';
import 'package:quizz_app/features/calendar/presentation/pages/calendar_page.dart';
import 'package:quizz_app/features/create/presentation/pages/create_page.dart';
import 'package:quizz_app/features/home/presentation/pages/home_page.dart';
import 'package:quizz_app/features/library/presentation/pages/library_page.dart';
import 'package:quizz_app/features/profile/presentation/pages/profile_page.dart';
import 'package:quizz_app/main_screen/indexBnb_stream.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final IndexBnbStream indexStream = locator<IndexBnbStream>();

  final List<Widget> _screen = [
    const HomePage(),
    const LibraryPage(),
    const CreatePage(),
    const CalendarPage(),
    const PersonalPage(),
  ];

  // int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
        stream: indexStream.indexBnbStream,
        builder: (context, snapshot) {
          var indexChosen = snapshot.data;
          return Scaffold(
            bottomNavigationBar: NavigationBar(
              animationDuration: Duration(seconds: 1),
              onDestinationSelected: (int index) {
                indexStream.chooseIndex(index);
              },
              indicatorColor: mainColor,
              selectedIndex: indexChosen ?? 0,
              destinations: <Widget>[
                const NavigationDestination(
                  // selectedIcon: Icon(Icons.home),
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                ),
                const NavigationDestination(
                  icon: Badge(child: Icon(Icons.book)),
                  label: 'Library',
                ),
                NavigationDestination(
                  icon: SvgPicture.asset(SvgIcon.addIcon),
                  label: 'Create',
                ),
                const NavigationDestination(
                  icon: Badge(
                    label: Text('2'),
                    child: Icon(Icons.calendar_month),
                  ),
                  label: 'Calendar',
                ),
                const NavigationDestination(
                  icon: Badge(
                    label: Text('2'),
                    child: Icon(Icons.person),
                  ),
                  label: 'Profile',
                ),
              ],
            ),
            body: _screen[indexChosen ?? 0],
          );
        });
  }
}
