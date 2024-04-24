import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:quizz_app/core/constant/color_value.dart';

import 'package:quizz_app/features/calendar/mock/calendar_entity.dart';
import 'package:quizz_app/features/calendar/mock/date_entity.dart';
import 'package:quizz_app/features/calendar/mock/mock_data.dart';
import 'package:quizz_app/features/calendar/mock/schedule_entity.dart';
import 'package:quizz_app/features/calendar/presentation/utils/calendar_streamer.dart';
import 'package:quizz_app/features/calendar/presentation/widgets/add_schedule_btn.dart';
import 'package:quizz_app/features/calendar/presentation/widgets/box_of_day.dart';
import 'package:quizz_app/features/calendar/presentation/widgets/build_list_schedule.dart';
import 'package:quizz_app/features/calendar/presentation/widgets/name_of_month_title.dart';

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
  int year = DateTime.now().year;
  // String timePicked = DateFormat.M().format(DateTime.now());
  String timePicked = "${DateFormat.EEEE().format(DateTime.now())}, ${DateTime.now().day}th";

  void getTimeToggle(String time) {
    setState(() {
      timePicked = time;
    });
  }

  late ScrollController _dayScroll;

  List<ScheduleEntity>? loadListSchedule(int day1, int month1, int year1) {
    CalendarEntity? tappedCalendar = mockCalendarList.singleWhere((element) {
      int day = int.parse(element.dateTime.day);
      int month = int.parse(element.dateTime.month);
      int year = int.parse(
        element.dateTime.year,
      );
      bool isChoose = day1 == day && month1 == month && year1 == year;

      return isChoose;
    }, orElse: () => CalendarEntity(dateTime: DateEntity(day: "", month: "", year: ""), listSchedule: const []));
    if (tappedCalendar ==
        CalendarEntity(
          dateTime: DateEntity(day: "", month: "", year: ""),
          listSchedule: const [],
        )) {
      return null;
    } else {
      return tappedCalendar.listSchedule;
    }
  }

  @override
  void initState() {
    _dayScroll = ScrollController();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _dayScroll.dispose();
    _calendarStreamer.disposed();
  }

  void pressDay(int day) {
    setState(() {
      chooseItemIndex.value = day + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        initialData: DateTime.now().month,
        stream: _calendarStreamer.calendarStream,
        builder: (context, snapshot) {
          //count days in a month rely year and month
          int dayInMoth = DateTime(year, snapshot.data ?? _calendarStreamer.month + 1, 0).day;

          //name of month
          String nameOfMonth = DateFormat('MMMM').format(DateTime(year, snapshot.data ?? _calendarStreamer.month));

          //name of day in a week
          dayInWeek(int day) => DateFormat('EEE').format(DateTime(DateTime.now().year, snapshot.data ?? _calendarStreamer.month, day));

          //name of day in a week (full name)
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
                    gradient: linearGradient,
                  ),
                  height: widget._size.height * 0.4,
                  child: Column(
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: NameOfMonthTitle(
                          nameOfMonth: nameOfMonth.toString(),
                          turnToNextMonth: _calendarStreamer.turnToNextMonth,
                          turnToPreMonth: _calendarStreamer.returnPrevMonth,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Flexible(
                        fit: FlexFit.loose,
                        flex: 1,
                        child: BoxOfDay(
                          pressDay: pressDay,
                          chooseItemIndex: chooseItemIndex,
                          dayInMoth: dayInMoth,
                          dayInWeek: dayInWeek,
                          loadListSchedule: loadListSchedule,
                          month: snapshot.data ?? _calendarStreamer.month,
                          year: year,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Flexible(flex: 1, child: AddScheduleButton()),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "${dayInWeekFull(chooseItemIndex.value)}, ${chooseItemIndex.value}th",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              BuildListSchedule(
                day: chooseItemIndex.value,
                month: snapshot.data ?? _calendarStreamer.month,
                year: year,
                loadListSchedule: loadListSchedule,
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          );
        });
  }
}
