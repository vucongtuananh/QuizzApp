import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:quizz_app/core/constant/color_value.dart';
import 'package:quizz_app/features/home/mock/mock_data.dart';
import 'package:quizz_app/features/home/mock/mock_word_model.dart';
import 'package:quizz_app/features/home/presentation/bloc/progress_cubit/progress_bar_cubit.dart';
import 'package:quizz_app/features/home/presentation/bloc/write_learn/write_learn_cubit.dart';
import 'package:quizz_app/features/home/presentation/bloc/write_learn/write_learn_state.dart';
import 'package:quizz_app/features/home/presentation/widgets/listen_learn/listen_learn_speaker.dart';
import 'package:quizz_app/features/home/presentation/widgets/write_learn/answer_input.dart';
import 'package:quizz_app/features/home/presentation/widgets/write_learn/write_learn_progress_bar.dart';

class ListenLearn extends StatefulWidget {
  const ListenLearn({
    super.key,
    required this.listWords,
  });

  final List<WordModel> listWords;
  @override
  State<ListenLearn> createState() => _ListenLearnState();
}

class _ListenLearnState extends State<ListenLearn> {
  late PageController _pageController;
  late TextEditingController _inputController;
  late FocusNode _focusNode;
  late FlutterTts _textToSpeech;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    _inputController = TextEditingController();
    _focusNode = FocusNode();
    _textToSpeech = FlutterTts();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _inputController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  Future<void> _speak(String voiceText) async {
    await _textToSpeech.setVolume(1);
    await _textToSpeech.setSpeechRate(0.5);
    await _textToSpeech.setPitch(1);
    await _textToSpeech.speak(voiceText);
  }

  Future<void> _speakLower(String voiceText) async {
    await _textToSpeech.setVolume(1);
    await _textToSpeech.setSpeechRate(0.3);
    await _textToSpeech.setPitch(1);
    await _textToSpeech.speak(voiceText);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var progressCubit = context.read<ProgressBarCubit>();
    return SafeArea(
      child: BlocListener<WriteLearnCubit, WriteLearnState>(
        listener: (context, state) {
          if (state is WriteLearnFinishState) {
            showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  // title: const Text('Basic dialog title'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Chúc mừng bạn đã hoàn thành kiểm tra",
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Bạn đã trả lời đúng ${state.countTrueAnswer}/${widget.listWords.length}",
                        style: const TextStyle(
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
        },
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 158, 190, 248),
          appBar: _appBar(progressCubit),
          body: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        height: size.height * 0.8,
                        child: PageView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: _pageController,
                          onPageChanged: (value) {
                            progressCubit.selectedPage(value);
                          },
                          itemBuilder: (context, index) {
                            return ListenLearnSpeaker(
                              wordModel: widget.listWords[index],
                            );
                          },
                          itemCount: widget.listWords.length,
                        ),
                      ),
                      AnswerInput(
                        focusNode: _focusNode,
                        controller: _inputController,
                        onFieldSubmitted: (value) async {
                          var currentWord = context.read<ProgressBarCubit>().state;
                          context.read<WriteLearnCubit>().submitAnswer(
                                wordModel: widget.listWords[currentWord],
                                answer: _inputController.text,
                                focusNode: _focusNode,
                                inputController: _inputController,
                                context: context,
                                pageController: _pageController,
                                listWords: widget.listWords,
                              );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              WriteLearnProgressBar(
                currentLength: progressCubit.state,
                length: widget.listWords.length,
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _appBar(ProgressBarCubit progressCubit) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: BlocBuilder<ProgressBarCubit, int>(
          builder: (context, state) {
            return RichText(
                text: TextSpan(
                    text: "Question ${progressCubit.state + 1}/",
                    style: const TextStyle(
                      color: mainColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    children: [
                  TextSpan(
                    text: listWords.length.toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                ]));
          },
        ),
      ),
      actions: [TextButton(onPressed: () {}, child: const Text("Skip"))],
    );
  }
}
