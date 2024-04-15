import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/features/home/mock/mock_data.dart';
import 'package:quizz_app/features/home/presentation/bloc/choose_answer_bloc/progress_bar_cubit.dart';
import 'package:quizz_app/features/home/presentation/widgets/progress_bar.dart';
import 'package:quizz_app/features/home/presentation/widgets/question_card.dart';

class ChooseAnswerLearn extends StatefulWidget {
  const ChooseAnswerLearn({super.key});

  @override
  State<ChooseAnswerLearn> createState() => _ChooseAnswerLearnState();
}

class _ChooseAnswerLearnState extends State<ChooseAnswerLearn> {
  late PageController _pageController;

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // title: const Text('Basic dialog title'),
          content: const Text('Do you want to end this section? Your process will not be saved'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var processCubit = context.read<ProgressBarCubit>();
    return WillPopScope(
      onWillPop: () async {
        _dialogBuilder(context);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              _dialogBuilder(context);
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.read<ProgressBarCubit>().skip();
                _pageController.animateToPage(processCubit.state, duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
              },
              child: const Text("Skip"),
            ),
          ],
        ),
        body: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProgressBar(),
            SizedBox(
              height: size.height * 0.6,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  context.read<ProgressBarCubit>().selectedPage(value);
                },
                itemBuilder: (context, index) {
                  return QuestionCard(
                    size: size,
                    question: sample_data[index],
                  );
                },
                itemCount: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
