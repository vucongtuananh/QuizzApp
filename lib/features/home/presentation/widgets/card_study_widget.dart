import 'package:flutter/material.dart';
import 'package:quizz_app/core/constant/color_value.dart';

class CardStudyWidget extends StatelessWidget {
  const CardStudyWidget({
    super.key,
    required Size size,
    required this.nameCard,
    required this.onTap,
  }) : _size = size;

  final Size _size;
  final String nameCard;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(left: _size.width * 0.04),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Card(
            elevation: 2,
            child: Container(
              // padding: const EdgeInsets.all(40),
              width: _size.width * 0.5,
              height: _size.width * 0.3,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    mainColor,
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
                color: Color.fromARGB(255, 87, 160, 255),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(nameCard),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            nameCard,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 19,
              color: Colors.black,
            ),
          ),
          Text(
            "3k Lượt học",
            style: TextStyle(
              // fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ]),
      ),
    );
  }
}
