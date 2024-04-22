import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz_app/core/constant/constant_value.dart';
import 'package:quizz_app/core/routes/app_router.dart';
import 'package:quizz_app/features/home/mock/mock_data.dart';
import 'package:quizz_app/features/home/presentation/widgets/card_detail/detail_header_title.dart';
import 'package:quizz_app/features/home/presentation/widgets/card_detail/detail_list_card_word.dart';
import 'package:quizz_app/features/home/presentation/widgets/card_detail/detail_list_words.dart';
import 'package:quizz_app/features/home/presentation/widgets/card_detail/detail_selection_study.dart';

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
            const DetailListCardWord(),
            SizedBox(
              height: _size.height * 0.02,
            ),
            DetailHeaderTitle(data: widget.data, size: _size),
            SizedBox(
              height: _size.height * 0.02,
            ),
            Column(
              children: [
                DetailSelectionStudy(
                  onTap: () => context.push(AppRouter.chooseAnswerLearn),
                  titleChoice: "Học",
                  specifyChoice: "Chọn đáp án đúng",
                ),
                DetailSelectionStudy(
                  onTap: () => context.push(AppRouter.writeLearn),
                  titleChoice: "Viết",
                  specifyChoice: "Viết lại các thuật ngữ đã học",
                ),
                DetailSelectionStudy(
                  onTap: () => context.push(AppRouter.listenLearn),
                  titleChoice: "Nghe",
                  specifyChoice: "Nghe lại các thuật ngữ đã học",
                ),
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
      DetailListWord(
        listWords: listWords,
      )
    ]);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(""),
        ),
        body: singleChildScrollView);
  }
}
