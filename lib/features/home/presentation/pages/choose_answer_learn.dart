import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_app/core/constant/color_value.dart';
import 'package:quizz_app/features/home/mock/mock_data.dart';
import 'package:quizz_app/features/home/presentation/bloc/choose_answer_bloc/choose_answer_bloc.dart';
import 'package:quizz_app/features/home/presentation/bloc/choose_answer_bloc/choose_answer_state.dart';
import 'package:quizz_app/features/home/presentation/bloc/progress_cubit/progress_bar_cubit.dart';
import 'package:quizz_app/features/home/presentation/widgets/choose_answer_learn/progress_bar.dart';
import 'package:quizz_app/features/home/presentation/widgets/choose_answer_learn/question_card.dart';

class ChooseAnswerLearn extends StatefulWidget {
  const ChooseAnswerLearn({super.key});

  @override
  State<ChooseAnswerLearn> createState() => _ChooseAnswerLearnState();
}

class _ChooseAnswerLearnState extends State<ChooseAnswerLearn> {
  late PageController _pageController;

  Future<void> _dialogExit(BuildContext context) {
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

  Future<void> _showResult(BuildContext context1) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // title: const Text('Basic dialog title'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Chúc mừng bạn đã hoàn thành kiểm tra",
                style: TextStyle(
                  color: mainColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Bạn đã trả lời đúng ${context1.read<ChooseAnswerBloc>().countTrueAnswer}/${sample_data.length}",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Ok'),
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
    _pageController = context.read<ChooseAnswerBloc>().pageController;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var processCubit = context.read<ProgressBarCubit>();
    return WillPopScope(
      onWillPop: () async {
        _dialogExit(context);
        return true;
      },
      child: BlocListener<ChooseAnswerBloc, ChooseAnswerState>(
        listener: (context, state) {
          if (state is ChooseAnswerConclusionState) {
            _showResult(context);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                _dialogExit(context);
              },
            ),
            actions: [
              TextButton.icon(
                label: Text("Hint"),
                icon: Icon(Icons.recommend),
                onPressed: () {
                  // context.read<ProgressBarCubit>().skip();
                  _pageController.animateToPage(processCubit.state, duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
                },
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProgressBar(
                  length: sample_data.length,
                  currentLength: processCubit.state,
                ),
                SizedBox(
                  height: size.height * 0.6,
                  child: PageView.builder(
                    physics: const NeverScrollableScrollPhysics(),
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
                    itemCount: sample_data.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
