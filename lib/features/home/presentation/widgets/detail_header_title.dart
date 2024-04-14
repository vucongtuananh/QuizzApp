import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quizz_app/core/constant/constant_value.dart';

class DetailHeaderTitle extends StatelessWidget {
  const DetailHeaderTitle({
    super.key,
    required this.data,
    required Size size,
  }) : _size = size;

  final String data;
  final Size _size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 30,
            ),
          ),
          Row(
            children: [
              SvgPicture.asset(SvgIcon.avatarBoyIcon, height: _size.height * 0.02),
              SizedBox(
                width: _size.width * 0.01,
              ),
              const Text(
                "Vu Cong Tuan anh |  21 items",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
