import 'package:quizz_app/features/calendar/mock/date_entity.dart';

class ScheduleEntity {
  String title;
  DateEntity dateTime;
  String beginTime;
  String finishTime;

  ScheduleEntity({
    required this.title,
    required this.dateTime,
    required this.beginTime,
    required this.finishTime,
  });
}
