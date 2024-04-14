import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz_app/core/constant/constant_value.dart';
import 'package:quizz_app/core/routes/app_router.dart';
import 'package:quizz_app/features/home/presentation/widgets/detail_header_title.dart';
import 'package:quizz_app/features/home/presentation/widgets/detail_list_card_word.dart';
import 'package:quizz_app/features/home/presentation/widgets/detail_list_words.dart';
import 'package:quizz_app/features/home/presentation/widgets/detail_selection_study.dart';

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
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
            DetailListCardWord(),
            SizedBox(
              height: _size.height * 0.02,
            ),
            DetailHeaderTitle(data: widget.data, size: _size),
            SizedBox(
              height: _size.height * 0.02,
            ),
            Column(
              children: [
                DetailSelectionStudy(onTap: () => context.push(AppRouter.chooseAnswerLearn)),
                DetailSelectionStudy(onTap: () => context.push(AppRouter.listenAndTypeLearn)),
                DetailSelectionStudy(onTap: () => context.push(AppRouter.chooseAnswerLearn)),
              ],
            ),
            SizedBox(
              height: _size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
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
      DetailListWord()
    ]);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(""),
        ),
        body: singleChildScrollView);
  }
}
