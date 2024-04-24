
import 'package:flutter/material.dart';
import 'package:quizz_app/core/constant/color_value.dart';
import 'package:quizz_app/features/calendar/mock/schedule_entity.dart';

class BuildListSchedule extends StatelessWidget {
  const BuildListSchedule({
    super.key,
    required this.day,
    required this.month,
    required this.year,
    required this.loadListSchedule,
  });

  final int day;
  final int month;
  final int year;
  final List<ScheduleEntity>? Function(
    int day1,
    int month1,
    int year1,
  ) loadListSchedule;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var listData = loadListSchedule(day, month, year);
    if (listData != null) {
      return Card(
        elevation: 2,
        child: SizedBox(
          height: size.height * 0.4,
          child: ListView.builder(
            // shrinkWrap: true,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Container(
                    width: size.width,
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
            height: size.height * 0.4,
            width: size.width,
            child: const Center(child: Text("There's no plan for this day")),
          ));
    }
  }
}
