import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz_app/core/routes/app_router.dart';
import 'package:quizz_app/features/home/presentation/widgets/card_study_widget.dart';

class TypesOfCardStudy extends StatelessWidget {
  const TypesOfCardStudy({super.key, required Size size, required this.typeCard}) : _size = size;

  final Size _size;
  final String typeCard;
  @override
  Widget build(BuildContext context) {
    void handleOntapCard(String nameCard) {
      context.push(
        AppRouter.cardDetail,
        extra: nameCard,
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                typeCard,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              GestureDetector(
                child: Text(
                  "Xem thêm",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          // margin: const EdgeInsets.symmetric(
          //   // horizontal: 20,
          //   vertical: 10,
          // ),
          height: _size.height * 0.25,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return CardStudyWidget(
                size: _size,
                nameCard: "Home",
                onTap: () => handleOntapCard("Home"),
              );
            },
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
