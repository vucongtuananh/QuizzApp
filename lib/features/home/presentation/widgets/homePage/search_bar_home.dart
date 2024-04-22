import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quizz_app/core/constant/constant_value.dart';

class SearchBarHome extends StatelessWidget {
  const SearchBarHome({
    super.key,
    required Size size,
  }) : _size = size;

  final Size _size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            width: 20,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: _size.width * 0.6,
                  height: _size.height * 0.05,
                  child: const TextField(
                    decoration: InputDecoration(border: InputBorder.none, hintText: "Study, sets, questions"),
                  ),
                ),
                SvgPicture.asset(
                  SvgIcon.searchIcon,
                  width: 20,
                  height: 20,
                ),
                const SizedBox(
                  width: 8,
                )
              ],
            ),
          ),
          SvgPicture.asset(SvgIcon.bellIcon),
        ],
      ),
    );
  }
}
