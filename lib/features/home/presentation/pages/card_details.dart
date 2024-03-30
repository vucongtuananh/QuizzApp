import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quizz_app/core/constant/color_value.dart';
import 'package:quizz_app/core/constant/constant_value.dart';
import 'package:quizz_app/features/home/presentation/widgets/card_word_details.dart';
import 'package:quizz_app/main.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CardDetails extends StatefulWidget {
  const CardDetails({
    super.key,
    required this.data,
  });

  final String data;

  @override
  State<CardDetails> createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  late final PageController _pageController;
  int _currentPage = 0;
  var listCardWord = [
    const CardWordDetails(
      meaning: "Nhà",
      word: "Home",
    ),
    const CardWordDetails(
      meaning: "Nhà",
      word: "Home",
    ),
    const CardWordDetails(
      meaning: "Nhà",
      word: "Home",
    ),
    const CardWordDetails(
      meaning: "Nhà",
      word: "Home",
    ),
    const CardWordDetails(
      meaning: "Nhà",
      word: "Home",
    ),
    const CardWordDetails(
      meaning: "Nhà",
      word: "Home",
    ),
  ];
  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 1);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(""),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _headerTitle(_size),
              SizedBox(
                height: _size.height * 0.02,
              ),
              _revisionSelection(_size),
              SizedBox(
                height: _size.height * 0.02,
              ),
              _bulidListCardWord(_size, _pageController),
            ],
          ),
        ));
  }

  Column _revisionSelection(Size _size) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Card(
            color: mainColor,
            child: Row(
              children: [
                SvgPicture.asset(
                  SvgIcon.learnIcon,
                  color: Colors.white,
                ),
                SizedBox(
                  width: _size.width * 0.02,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Học",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Ôn tập các thuật ngữ đã học",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Card(
            color: mainColor,
            child: Row(
              children: [
                SvgPicture.asset(
                  SvgIcon.learnIcon,
                  color: Colors.white,
                ),
                SizedBox(
                  width: _size.width * 0.02,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Học",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Ôn tập các thuật ngữ đã học",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Card(
            color: mainColor,
            child: Row(
              children: [
                SvgPicture.asset(
                  SvgIcon.learnIcon,
                  color: Colors.white,
                ),
                SizedBox(
                  width: _size.width * 0.02,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Học",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Ôn tập các thuật ngữ đã học",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Card(
            color: mainColor,
            child: Row(
              children: [
                SvgPicture.asset(
                  SvgIcon.learnIcon,
                  color: Colors.white,
                ),
                SizedBox(
                  width: _size.width * 0.02,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Học",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Ôn tập các thuật ngữ đã học",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _headerTitle(Size _size) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.data,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 30,
            ),
          ),
          Row(
            children: [
              SvgPicture.asset(SvgIcon.starYellow, height: _size.height * 0.02),
              SizedBox(
                width: _size.width * 0.01,
              ),
              const Text(
                "5.0 (2 lượt đánh giá)",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _bulidListCardWord(Size _size, PageController controller) {
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
                setState(() {
                  _currentPage = value;
                });
              },
            ),
          ),
        ),
        SizedBox(
          height: _size.height * 0.01,
        ),
        SmoothPageIndicator(
            controller: controller,
            count: listCardWord.length,
            effect: ExpandingDotsEffect(
              dotHeight: _size.height * 0.01,
              dotWidth: _size.height * 0.01,
              activeDotColor: mainColor,
              spacing: _size.width * 0.01,
            )),
      ],
    );
  }
}
