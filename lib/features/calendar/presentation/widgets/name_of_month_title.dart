import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quizz_app/core/constant/color_value.dart';
import 'package:quizz_app/core/constant/constant_value.dart';

class NameOfMonthTitle extends StatelessWidget {
  const NameOfMonthTitle({
    super.key,
    required this.nameOfMonth,
    required this.turnToNextMonth,
    required this.turnToPreMonth,
  });

  final String nameOfMonth;
  final VoidCallback turnToPreMonth;
  final VoidCallback turnToNextMonth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            // splashColor: mainColor,
            borderRadius: BorderRadius.circular(10),

            customBorder: const CircleBorder(),
            onTap: () {
              turnToPreMonth();
              // _calendarStreamer.returnPrevMonth();
            },
            child: SvgPicture.asset(
              SvgIcon.arrowPreIcon,
              height: 50,
            ),
          ),
          Text(
            nameOfMonth,
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
              turnToNextMonth();
              // _calendarStreamer.turnToNextMonth();
            },
            child: SvgPicture.asset(
              SvgIcon.arrowNextIcon,
              height: 50,
            ),
          ),
        ],
      ),
    );
  }
}
