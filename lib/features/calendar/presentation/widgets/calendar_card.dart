import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:quizz_app/core/constant/color_value.dart';
import 'package:quizz_app/core/constant/constant_value.dart';
import 'package:quizz_app/core/routes/app_router.dart';
import 'package:quizz_app/features/calendar/domain/calendar_entity.dart';
import 'package:quizz_app/features/calendar/domain/date_entity.dart';
import 'package:quizz_app/features/calendar/domain/mock_data.dart';
import 'package:quizz_app/features/calendar/domain/schedule_entity.dart';

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

  List<ScheduleEntity> _listSchedule = [];

  final List<CalendarEntity> _mockCalendarList = [
    CalendarEntity(dateTime: DateEntity(day: '05', month: '04', year: '2024'), listSchedule: listSchedule1),
    CalendarEntity(dateTime: DateEntity(day: '05', month: '05', year: '2024'), listSchedule: listSchedule2),
    CalendarEntity(dateTime: DateEntity(day: '06', month: '06', year: '2024'), listSchedule: listSchedule3),
    CalendarEntity(dateTime: DateEntity(day: '07', month: '07', year: '2024'), listSchedule: listSchedule4),
    CalendarEntity(dateTime: DateEntity(day: '08', month: '08', year: '2024'), listSchedule: listSchedule5),
    CalendarEntity(dateTime: DateEntity(day: '09', month: '09', year: '2024'), listSchedule: listSchedule6),
    CalendarEntity(dateTime: DateEntity(day: '10', month: '10', year: '2024'), listSchedule: listSchedule7),
    CalendarEntity(dateTime: DateEntity(day: '11', month: '11', year: '2024'), listSchedule: listSchedule8),
    CalendarEntity(dateTime: DateEntity(day: '12', month: '12', year: '2024'), listSchedule: listSchedule9),
  ];

  void getTimeToggle(String time) {
    setState(() {
      timePicked = time;
    });
  }

  void loadListSchedule(DateTime dateTime) {
    CalendarEntity tappedCalendar = _mockCalendarList.singleWhere((element) {
      int day = int.parse(element.dateTime.day);
      int month = int.parse(element.dateTime.month);
      int year = int.parse(
        element.dateTime.year,
      );
      ;
      bool isChoose = dateTime.day == day && dateTime.month == month && dateTime.year == year;

      return isChoose;
    });
    setState(() {
      _listSchedule = tappedCalendar.listSchedule;
    });
  }

  @override
  void initState() {
    super.initState();
    loadListSchedule(DateTime.now());
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
                      _boxOfDay(
                        dayInWeek,
                        dayInMoth,
                        snapshot.data ?? _calendarStreamer.month,
                      ),
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
              Card(
                elevation: 2,
                child: SizedBox(
                  height: widget._size.height * 0.4,
                  child: ListView.builder(
                    // shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: Container(
                            width: widget._size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: mainColor.withOpacity(0.2),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _listSchedule[index].title,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "${_listSchedule[index].beginTime} - ${_listSchedule[index].finishTime}",
                                    style: TextStyle(
                                      color: mainColor,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      );
                    },
                    itemCount: _listSchedule.length,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
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

  Flexible _boxOfDay(String Function(int day) dayInWeek, int dayInMoth, int month) {
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
                loadListSchedule(DateTime(
                  DateTime.now().year,
                  month,
                  index + 1,
                ));
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
