import 'package:flutter/material.dart';
import 'package:quizz_app/core/constant/color_value.dart';
import 'package:quizz_app/features/home/mock/mock_data.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DetailListCardWord extends StatefulWidget {
  const DetailListCardWord({
    super.key,
  });

  @override
  State<DetailListCardWord> createState() => _DetailListCardWordState();
}

class _DetailListCardWordState extends State<DetailListCardWord> {
  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(viewportFraction: 1);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            height: _size.height * 0.2,
            child: PageView.builder(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              controller: _pageController,
              itemBuilder: (context, index) {
                return listCardWord[index];
              },
              itemCount: listCardWord.length,
              onPageChanged: (value) {
                // setState(() {
                //   _currentPage = value;
                // });
              },
            ),
          ),
        ),
        SizedBox(
          height: _size.height * 0.01,
        ),
        SmoothPageIndicator(
            controller: _pageController,
            count: 3,
            effect: ScrollingDotsEffect(
              dotHeight: _size.height * 0.01,
              dotWidth: _size.height * 0.01,
              activeDotColor: mainColor,
              spacing: _size.width * 0.01,
            )),
      ],
    );
  }
}
