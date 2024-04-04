import 'package:quizz_app/features/calendar/domain/date_entity.dart';
import 'package:quizz_app/features/calendar/domain/schedule_entity.dart';

class CalendarEntity {
  DateEntity dateTime;
  List<ScheduleEntity> listSchedule;

  CalendarEntity({required this.dateTime, required this.listSchedule});
}
