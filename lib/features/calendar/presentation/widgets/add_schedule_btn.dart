import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz_app/core/routes/app_router.dart';

class AddScheduleButton extends StatelessWidget {
  const AddScheduleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          context.push(AppRouter.plannerCalendar);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 120,
            vertical: 20,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text(
            "Add Schedule",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
