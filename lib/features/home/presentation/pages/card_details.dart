import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quizz_app/core/constant/color_value.dart';
import 'package:quizz_app/core/constant/constant_value.dart';
import 'package:quizz_app/features/home/presentation/widgets/card_word_details.dart';
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

  final List<Map<String, String>> _listWords = [
    {'Loft': 'Gác lưng, tầng lửng chỉ để xếp đồ, không để ở'},
    {'Loft': 'Gác lưng, tầng lửng chỉ để xếp đồ, không để ở'},
    {'Loft': 'Gác lưng, tầng lửng chỉ để xếp đồ, không để ở'},
    {'Loft': 'Gác lưng, tầng lửng chỉ để xếp đồ, không để ở'},
    {'Loft': 'Gác lưng, tầng lửng chỉ để xếp đồ, không để ở'},
    {'Loft': 'Gác lưng, tầng lửng chỉ để xếp đồ, không để ở'},
    {'Loft': 'Gác lưng, tầng lửng chỉ để xếp đồ, không để ở'},
    {'Loft': 'Gác lưng, tầng lửng chỉ để xếp đồ, không để ở'},
    {'Loft': 'Gác lưng, tầng lửng chỉ để xếp đồ, không để ở'},
    {'Loft': 'Gác lưng, tầng lửng chỉ để xếp đồ, không để ở'},
    {'Loft': 'Gác lưng, tầng lửng chỉ để xếp đồ, không để ở'},
    {'Loft': 'Gác lưng, tầng lửng chỉ để xếp đồ, không để ở'},
    {'Loft': 'Gác lưng, tầng lửng chỉ để xếp đồ, không để ở'},
    {'Loft': 'Gác lưng, tầng lửng chỉ để xếp đồ, không để ở'},
    {'Loft': 'Gác lưng, tầng lửng chỉ để xếp đồ, không để ở'},
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
    var singleChildScrollView = CustomScrollView(slivers: [
      SliverToBoxAdapter(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _bulidListCardWord(_size, _pageController),
            SizedBox(
              height: _size.height * 0.02,
            ),
            _headerTitle(_size),
            SizedBox(
              height: _size.height * 0.02,
            ),
            _revisionSelection(_size),
            SizedBox(
              height: _size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Card",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(SvgIcon.filterIcon),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: _size.height * 0.02,
            ),
          ],
        ),
      ),
      _listWord()
    ]);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(""),
        ),
        body: singleChildScrollView);
  }

  SliverList _listWord() {
    return SliverList.builder(
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 5),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(flex: 1, child: Align(alignment: Alignment.centerLeft, child: Text(_listWords[index].keys.toString()))),
                Expanded(
                    flex: 2,
                    child: Center(
                        child: Text(
                      _listWords[index].values.toString(),
                    ))),
                Expanded(flex: 1, child: Align(alignment: Alignment.centerRight, child: Icon(Icons.volume_down_outlined))),
              ],
            ),
          ),
        );
      },
      itemCount: _listWords.length,
    );
  }

  Column _revisionSelection(Size size) {
    return Column(
      children: [
        _selectionElement(size),
        _selectionElement(size),
        _selectionElement(size),
      ],
    );
  }

  Padding _selectionElement(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            children: [
              SvgPicture.asset(
                SvgIcon.learnIcon,
                color: mainColor,
              ),
              SizedBox(
                width: size.width * 0.02,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Học",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Ôn tập các thuật ngữ đã học",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
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
