import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:quizz_app/core/constant/color_value.dart';
import 'package:quizz_app/core/constant/constant_value.dart';
import 'package:quizz_app/core/routes/app_router.dart';
import 'package:quizz_app/features/calendar/mock/calendar_entity.dart';
import 'package:quizz_app/features/calendar/mock/date_entity.dart';
import 'package:quizz_app/features/calendar/mock/mock_data.dart';
import 'package:quizz_app/features/calendar/mock/schedule_entity.dart';
import 'package:quizz_app/features/calendar/presentation/utils/calendar_streamer.dart';

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
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _calendarStreamer.disposed();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        initialData: DateTime.now().month,
        stream: _calendarStreamer.calendarStream,
        builder: (context, snapshot) {
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
                    gradient: linearGradient,
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
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "${dayInWeekFull(chooseItemIndex.value)}, ${chooseItemIndex.value}th",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              _buildListSchedule(day: chooseItemIndex.value, month: snapshot.data ?? _calendarStreamer.month, year: year),
              const SizedBox(
                height: 30,
              ),
            ],
          );
        });
  }

  Widget _buildListSchedule({required int day, required int month, required int year}) {
    var listData = loadListSchedule(day, month, year);
    if (listData != null) {
      return Card(
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
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            listData[index].title,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${listData[index].beginTime} - ${listData[index].finishTime}",
                            style: const TextStyle(
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
            itemCount: listData.length,
          ),
        ),
      );
    } else {
      return Card(
          elevation: 2,
          child: SizedBox(
            height: widget._size.height * 0.4,
            width: widget._size.width,
            child: const Center(child: Text("There's no plan for this day")),
          ));
    }
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
                // loadListScheduleSchedule(DateTime(
                //   DateTime.now().year,
                //   month,
                //   index + 1,
                // ));
              },
              child: ListenableBuilder(
                listenable: chooseItemIndex,
                builder: (context, child) {
                  bool haveSchedule = loadListSchedule(index + 1, month, year) != null;
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
                        const SizedBox(
                          height: 20,
                        ),
                        haveSchedule
                            ? Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(45),
                                ),
                              )
                            : Container()
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
            InkWell(
              // splashColor: mainColor,
              borderRadius: BorderRadius.circular(10),

              customBorder: const CircleBorder(),
              onTap: () {
                _calendarStreamer.returnPrevMonth();
              },
              child: SvgPicture.asset(
                SvgIcon.arrowPreIcon,
                height: 50,
              ),
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
            InkWell(
              // borderRadius: BorderRadius.circular(10),
              customBorder: const CircleBorder(side: BorderSide(color: mainColor, width: 1)),
              onTap: () {
                _calendarStreamer.turnToNextMonth();
              },
              child: SvgPicture.asset(
                SvgIcon.arrowNextIcon,
                height: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
