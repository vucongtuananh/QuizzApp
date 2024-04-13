import 'package:equatable/equatable.dart';
import 'package:quizz_app/features/calendar/mock/date_entity.dart';
import 'package:quizz_app/features/calendar/mock/schedule_entity.dart';

// ignore: must_be_immutable
class CalendarEntity extends Equatable {
  DateEntity dateTime;
  List<ScheduleEntity> listSchedule;

  CalendarEntity({required this.dateTime, required this.listSchedule});

  @override
  List<Object?> get props => [
        dateTime,
        listSchedule,
      ];
}
