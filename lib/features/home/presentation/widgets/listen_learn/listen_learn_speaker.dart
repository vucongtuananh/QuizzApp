import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:quizz_app/core/constant/constant_value.dart';
import 'package:quizz_app/features/home/mock/mock_word_model.dart';

class ListenLearnSpeaker extends StatefulWidget {
  const ListenLearnSpeaker({
    super.key,
    required this.wordModel,
  });

  final WordModel wordModel;

  @override
  State<ListenLearnSpeaker> createState() => _ListenLearnSpeakerState();
}

class _ListenLearnSpeakerState extends State<ListenLearnSpeaker> {
  late FlutterTts _textToSpeech;

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
  void initState() {
    _textToSpeech = FlutterTts();
    _speak(widget.wordModel.word);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () => _speak(widget.wordModel.word),
          child: const Icon(
            Icons.volume_up_outlined,
            size: 80,
          ),
        ),
        InkWell(
            onTap: () => _speakLower(widget.wordModel.word),
            child: SvgPicture.asset(
              SvgIcon.slowDownIcon,
              width: 60,
            )),
      ],
    );
  }
}
