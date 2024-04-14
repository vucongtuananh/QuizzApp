import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quizz_app/core/constant/color_value.dart';
import 'package:quizz_app/features/calendar/mock/calendar_entity.dart';
import 'package:quizz_app/features/calendar/mock/date_entity.dart';
import 'package:quizz_app/features/calendar/mock/mock_data.dart';
import 'package:quizz_app/features/home/presentation/widgets/header_image.dart';
import 'package:quizz_app/features/home/presentation/widgets/list_schedule_today.dart';
import 'package:quizz_app/features/home/presentation/widgets/search_bar_home.dart';
import 'package:quizz_app/features/home/presentation/widgets/types_card_study.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _mockListScheduleToday = CalendarEntity(dateTime: DateEntity(day: '06', month: '04', year: '2024'), listSchedule: listSchedule1);

  List<Widget> listImageHeader = [
    Image.asset('assets/images/image/img1.png'),
    Image.asset('assets/images/image/img2.jpg'),
  ];
  int _currentPage = 0;
  Timer? timer;
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < listImageHeader.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeInCubic,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    Widget homeWidget = Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 250, 250),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: false,
            pinned: true,
            // pinned: false,
            // snap: true,
            backgroundColor: Colors.blueAccent,
            stretch: true,

            stretchTriggerOffset: 300.0,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: linearGradient,
                ),
                child: SearchBarHome(size: _size),
              ),
              centerTitle: true,
              title: const Text(
                'F L U X Q U I Z',
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const HeaderImage(),
                SizedBox(
                  height: _size.height * 0.03,
                ),
                TypesOfCardStudy(size: _size, typeCard: 'Phổ biến'),
                SizedBox(
                  height: _size.height * 0.03,
                ),
                TypesOfCardStudy(size: _size, typeCard: 'Đề xuất'),
                SizedBox(
                  height: _size.height * 0.03,
                ),
                // ignore: prefer_const_constructors
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: const Text(
                    "Today's Schedule",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListScheduleToday(size: _size, mockListScheduleToday: _mockListScheduleToday)
              ],
            ),
          ),
        ],
      ),
    );
    return homeWidget;
  }
}
