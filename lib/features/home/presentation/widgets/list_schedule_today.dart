import 'package:flutter/material.dart';

import 'package:quizz_app/core/constant/constant_value.dart';
import 'package:quizz_app/core/di/app_di.dart';

import 'package:quizz_app/features/calendar/mock/calendar_entity.dart';
import 'package:quizz_app/main_screen/indexBnb_stream.dart';

class ListScheduleToday extends StatelessWidget {
  const ListScheduleToday({
    super.key,
    required Size size,
    required CalendarEntity mockListScheduleToday,
  })  : _size = size,
        _mockListScheduleToday = mockListScheduleToday;

  final Size _size;
  final CalendarEntity _mockListScheduleToday;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      height: _size.height * 0.4,
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 152, 202, 248),
                    ),
                    margin: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          _mockListScheduleToday.listSchedule[3].title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "${_mockListScheduleToday.listSchedule[1].beginTime} - ${_mockListScheduleToday.listSchedule[1].finishTime}",
                          style: const TextStyle(
                            color: Color.fromARGB(255, 236, 234, 234),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Container(
                    padding: const EdgeInsets.only(left: 8),
                    width: double.infinity,
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 170, 217, 255),
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            alignment: Alignment.bottomRight,
                            image: AssetImage(
                              Img.imageSchedule2,
                            ))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          _mockListScheduleToday.listSchedule[2].title,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          "${_mockListScheduleToday.listSchedule[1].beginTime} - ${_mockListScheduleToday.listSchedule[1].finishTime}",
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Flexible(
                  flex: 2,
                  child: Card(
                    elevation: 4,
                    color: const Color(0xffFFE9E9),
                    margin: const EdgeInsets.all(8),
                    child: Container(
                      padding: const EdgeInsets.only(left: 8),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              alignment: Alignment.bottomRight,
                              image: AssetImage(
                                Img.imageSchedule,
                              ))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            _mockListScheduleToday.listSchedule[1].title,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            "${_mockListScheduleToday.listSchedule[1].beginTime} - ${_mockListScheduleToday.listSchedule[1].finishTime}",
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: InkWell(
                    onTap: () => locator<IndexBnbStream>().chooseIndex(3),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey,
                      ),
                      margin: const EdgeInsets.all(8),
                      child: const Center(
                        child: Text(
                          "Xem thêm",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
