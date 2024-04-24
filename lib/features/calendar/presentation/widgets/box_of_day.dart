import 'package:flutter/material.dart';
import 'package:quizz_app/features/calendar/mock/schedule_entity.dart';

class BoxOfDay extends StatefulWidget {
  const BoxOfDay({
    super.key,
    required this.dayInMoth,
    required this.month,
    required this.dayInWeek,
    required this.chooseItemIndex,
    required this.loadListSchedule,
    required this.year,
    required this.pressDay,
  });
  final String Function(int day) dayInWeek;
  final int year;
  final int dayInMoth;
  final int month;
  final ValueNotifier<int> chooseItemIndex;
  final List<ScheduleEntity>? Function(int day1, int month1, int year1) loadListSchedule;
  final Function(int a) pressDay;
  @override
  State<BoxOfDay> createState() => _BoxOfDayState();
}

class _BoxOfDayState extends State<BoxOfDay> {
  final ScrollController _dayScroll = ScrollController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToCurrentDay();
    });
  }

  void _scrollToCurrentDay() {
    // Get the current day
    int currentDay = DateTime.now().day;

    // Calculate the offset to scroll to
    double offset = (currentDay + 4) * 60.0; // Assuming each day box is 70 pixels wide

    // Scroll to the offset
    _dayScroll.jumpTo(
      offset,
      // duration: Duration(milliseconds: 300),
      // curve: Curves.linear,
    );
  }

  @override
  void dispose() {
    _dayScroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 50,
      child: ListView.builder(
        controller: _dayScroll,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              widget.pressDay(index);
            },
            child: ListenableBuilder(
              listenable: widget.chooseItemIndex,
              builder: (context, child) {
                bool haveSchedule = widget.loadListSchedule(index + 1, widget.month, widget.year) != null;
                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  width: 60,
                  decoration: BoxDecoration(
                      color: widget.chooseItemIndex.value - 1 == index ? Colors.white : Colors.transparent,
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
                        widget.dayInWeek(index + 1),
                        style: TextStyle(
                          color: widget.chooseItemIndex.value - 1 == index ? Colors.black : Colors.white,
                        ),
                      ),
                      Text(
                        (index + 1).toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: widget.chooseItemIndex.value - 1 == index ? Colors.black : Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      haveSchedule
                          ? Container(
                              width: 5,
                              height: 5,
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
        itemCount: widget.dayInMoth,
      ),
    );
  }
}
