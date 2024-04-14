import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:quizz_app/features/home/mock/mock_data.dart';

enum TtsState { playing, stopped, paused, continued }

class DetailListWord extends StatefulWidget {
  const DetailListWord({
    super.key,
  });

  @override
  State<DetailListWord> createState() => _DetailListWordState();
}

class _DetailListWordState extends State<DetailListWord> {
  late FlutterTts flutterTts;
  TtsState ttsState = TtsState.stopped;
  // ignore: unused_field

  Future<void> _speak(String voiceText) async {
    await flutterTts.setVolume(1);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setPitch(1);
    await flutterTts.speak(voiceText);
  }

  @override
  void initState() {
    super.initState();
    flutterTts = FlutterTts();
  }

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 5),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(flex: 1, child: Align(alignment: Alignment.centerLeft, child: Text(listWords[index].keys.toString()))),
                Expanded(
                    flex: 2,
                    child: Center(
                        child: Text(
                      listWords[index].values.toString(),
                    ))),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      _speak(
                        listWords[index].keys.toString(),
                      );
                    },
                    child: const Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.volume_down_outlined,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: listWords.length,
    );
  }
}
