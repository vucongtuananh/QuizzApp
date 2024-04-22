import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quizz_app/features/home/mock/mock_word_model.dart';

class CardWordDetails extends StatefulWidget {
  const CardWordDetails({
    super.key,
    required this.wordModel,
    // required Size size,
  });
  final WordModel wordModel;

  @override
  State<CardWordDetails> createState() => _CardWordDetailsState();
}

class _CardWordDetailsState extends State<CardWordDetails> with TickerProviderStateMixin {
  late final AnimationController _animationController;
  late Animation _animation;
  AnimationStatus _animationStatus = AnimationStatus.dismissed;

  void handleFlipCard() {
    if (_animationStatus == AnimationStatus.dismissed) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 300,
      ),
    );
    _animation = Tween(end: 1.0, begin: 0.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        _animationStatus = status;
      });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handleFlipCard,
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..setEntry(2, 1, 0.0015)
          ..rotateX(pi * _animation.value),
        child: Card(
            elevation: 2,
            child: _animation.value <= 0.5
                ? Container(
                    clipBehavior: Clip.none,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: Text(widget.wordModel.word)),
                  )
                : Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationX(pi),
                    child: Container(
                      clipBehavior: Clip.none,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(child: Text(widget.wordModel.meaning)),
                    ),
                  )),
      ),
    );
  }
}
