import 'package:flutter/material.dart';
import 'package:quizz_app/core/constant/color_value.dart';
import 'package:quizz_app/features/calendar/presentation/widgets/calendar_card.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
        // appBar: AppBar(title: Text("Calendar")),
        body: SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            CalendarCard(
              size: _size,
            ),
            const SizedBox(
              height: 10,
            ),
            Card(
              elevation: 2,
              child: SizedBox(
                height: _size.height * 0.4,
                child: ListView.builder(
                  // shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: Container(
                          width: _size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: mainColor.withOpacity(0.2),
                            // gradient: const LinearGradient(
                            //   colors: [
                            //     mainColor,
                            //     Colors.transparent,
                            //   ],
                            //   begin: Alignment.bottomLeft,
                            //   end: Alignment.topRight,
                            // ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Revision",
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
                                  "10:00 pm - 12:00 pm",
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
                  itemCount: 10,
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
