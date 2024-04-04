import 'package:quizz_app/features/calendar/domain/calendar_entity.dart';
import 'package:quizz_app/features/calendar/domain/date_entity.dart';
import 'package:quizz_app/features/calendar/domain/schedule_entity.dart';

List<ScheduleEntity> listSchedule = [
  ScheduleEntity(beginTime: "9:00", dateTime: DateEntity(day: "4", month: "4", year: "2024"), finishTime: "10:00", title: "On tap u1"),
  ScheduleEntity(beginTime: "9:00", dateTime: DateEntity(day: "4", month: "4", year: "2024"), finishTime: "10:00", title: "On tap u1"),
  ScheduleEntity(beginTime: "9:00", dateTime: DateEntity(day: "4", month: "4", year: "2024"), finishTime: "10:00", title: "On tap u1"),
  ScheduleEntity(beginTime: "9:00", dateTime: DateEntity(day: "4", month: "4", year: "2024"), finishTime: "10:00", title: "On tap u1"),
  ScheduleEntity(beginTime: "9:00", dateTime: DateEntity(day: "4", month: "4", year: "2024"), finishTime: "10:00", title: "On tap u1"),
];

CalendarEntity calendarEntity = CalendarEntity(dateTime: DateEntity(day: '4', month: '4', year: '2024'), listSchedule: listSchedule);
