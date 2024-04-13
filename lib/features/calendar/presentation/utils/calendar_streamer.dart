import 'dart:async';

class CalendarStreamer {
  int month = DateTime.now().month;

  final StreamController<int> _calendarController = StreamController<int>.broadcast();
  Stream<int> get calendarStream => _calendarController.stream;

  void returnPrevMonth() {
    if (month == 1) return;
    month -= 1;
    _calendarController.sink.add(month);
  }

  void turnToNextMonth() {
    if (month == 12) return;
    month += 1;
    _calendarController.sink.add(month);
  }

  void disposed() {
    _calendarController.close();
  }
}
