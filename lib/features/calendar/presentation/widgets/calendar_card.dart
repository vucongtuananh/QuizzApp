import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:quizz_app/core/constant/color_value.dart';
import 'package:quizz_app/core/constant/constant_value.dart';
import 'package:quizz_app/core/routes/app_router.dart';

class CalendarCard extends StatefulWidget {
  const CalendarCard({
    super.key,
    required Size size,
  }) : _size = size;

  final Size _size;
  @override
  State<CalendarCard> createState() => _CalendarCardState();
}

class _CalendarCardState extends State<CalendarCard> {
  final CalendarStreamer _calendarStreamer = CalendarStreamer();
  final ValueNotifier<int> chooseItemIndex = ValueNotifier<int>(DateTime.now().day);
  // String timePicked = DateFormat.M().format(DateTime.now());
  String timePicked = "${DateFormat.EEEE().format(DateTime.now())}, ${DateTime.now().day}th";

  void getTimeToggle(String time) {
    setState(() {
      timePicked = time;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _calendarStreamer.disposed();
  }

  @override
  Widget build(BuildContext context) {
    int year = DateTime.now().year;

    return StreamBuilder(
        initialData: DateTime.now().month,
        stream: _calendarStreamer.calendarStream,
        builder: (context, snapshot) {
          print(snapshot.data);
          int dayInMoth = DateTime(year, snapshot.data ?? _calendarStreamer.month + 1, 0).day;
          String nameOfMonth = DateFormat('MMMM').format(DateTime(year, snapshot.data ?? _calendarStreamer.month));
          dayInWeek(int day) => DateFormat('EEE').format(DateTime(DateTime.now().year, snapshot.data ?? _calendarStreamer.month, day));
          dayInWeekFull(int day) => DateFormat('EEEE').format(DateTime(DateTime.now().year, snapshot.data ?? _calendarStreamer.month, day));
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                margin: const EdgeInsets.all(10),
                elevation: 2,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: mainColor,
                    gradient: const LinearGradient(
                      colors: [
                        mainColor,
                        Colors.transparent,
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    ),
                  ),
                  height: widget._size.height * 0.4,
                  child: Column(
                    children: [
                      _titleMonth(nameOfMonth),
                      const SizedBox(
                        height: 10,
                      ),
                      _boxOfDay(dayInWeek, dayInMoth),
                      const SizedBox(
                        height: 10,
                      ),
                      _addButton(context),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "${dayInWeekFull(chooseItemIndex.value)}, ${chooseItemIndex.value}th",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          );
        });
  }

  Flexible _addButton(BuildContext context) {
    return Flexible(
        flex: 1,
        child: Center(
          child: GestureDetector(
            onTap: () {
              context.push(AppRouter.plannerCalendar);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 120,
                vertical: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                "Add Schedule",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ));
  }

  Flexible _boxOfDay(String Function(int day) dayInWeek, int dayInMoth) {
    return Flexible(
      fit: FlexFit.loose,
      flex: 1,
      child: SizedBox(
        // height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // getTimeToggle("${dayInWeekFull(index + 1)} ${index + 1}th");
                setState(() {
                  chooseItemIndex.value = index + 1;
                });
              },
              child: ListenableBuilder(
                listenable: chooseItemIndex,
                builder: (context, child) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    width: 60,
                    decoration: BoxDecoration(
                        color: chooseItemIndex.value - 1 == index ? Colors.white : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.white,
                        )),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          dayInWeek(index + 1),
                          style: TextStyle(
                            color: chooseItemIndex.value - 1 == index ? Colors.black : Colors.white,
                          ),
                        ),
                        Text(
                          (index + 1).toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: chooseItemIndex.value - 1 == index ? Colors.black : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
          itemCount: dayInMoth,
        ),
      ),
    );
  }

  Flexible _titleMonth(String nameOfMonth) {
    return Flexible(
      fit: FlexFit.tight,
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                _calendarStreamer.returnPrevMonth();
              },
              child: SvgPicture.asset(SvgIcon.arrowPreIcon),
            ),
            Text(
              nameOfMonth.toString(),
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30, shadows: [
                Shadow(
                  color: Color.fromARGB(255, 145, 141, 141),
                  offset: Offset(0, 3),
                  blurRadius: 2,
                )
              ]),
            ),
            GestureDetector(
              onTap: () {
                _calendarStreamer.turnToNextMonth();
              },
              child: SvgPicture.asset(SvgIcon.arrowNextIcon),
            ),
          ],
        ),
      ),
    );
  }
}

class CalendarStreamer {
  int month = DateTime.now().month;

  final StreamController<int> _calendarController = StreamController<int>.broadcast();
  Stream<int> get calendarStream => _calendarController.stream;

  void returnPrevMonth() {
    if (month == 1) return;
    month -= 1;
    _calendarController.sink.add(month);
  }

  void turnToNextMonth() {
    if (month == 12) return;
    month += 1;
    _calendarController.sink.add(month);
  }

  void disposed() {
    _calendarController.close();
  }
}