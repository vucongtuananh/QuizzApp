import 'package:flutter/material.dart';
import 'package:quizz_app/features/home/presentation/widgets/homePage/types_card_study.dart';

class LibraryStudyTab extends StatelessWidget {
  const LibraryStudyTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: _size.height * 0.02,
          ),
          Container(
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            // width: _size.width * 0.5,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Find your collections",
              ),
            ),
          ),
          SizedBox(
            height: _size.height * 0.02,
          ),
          TypesOfCardStudy(size: _size, typeCard: 'Phổ biến'),
          SizedBox(
            height: _size.height * 0.02,
          ),
          TypesOfCardStudy(size: _size, typeCard: 'Đề xuất'),
          SizedBox(
            height: _size.height * 0.02,
          ),
          TypesOfCardStudy(size: _size, typeCard: 'Đánh giá cao'),
        ],
      ),
    );
  }
}
