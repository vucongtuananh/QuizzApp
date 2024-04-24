import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:quizz_app/core/constant/color_value.dart';
import 'package:quizz_app/core/constant/constant_value.dart';
import 'package:quizz_app/features/calendar/mock/date_entity.dart';
import 'package:quizz_app/features/calendar/mock/mock_data.dart';
import 'package:quizz_app/features/calendar/mock/schedule_entity.dart';
import 'package:quizz_app/local_notification.dart';

class PlannerCalendar extends StatefulWidget {
  const PlannerCalendar({super.key});

  @override
  State<PlannerCalendar> createState() => _PlannerCalendarState();
}

class _PlannerCalendarState extends State<PlannerCalendar> {
  late DateTime _datePicked = DateTime.now();

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _beginTimeController = TextEditingController();
  final TextEditingController _finishTimeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();
  Future<void> showPickerDate(
    BuildContext context,
  ) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        _dateController.text = DateFormat.yMMMMEEEEd().format(picked);
        _datePicked = picked;
      });
    }
  }

  Future<void> showPickerTime(
    BuildContext context,
    TextEditingController controller,
  ) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        controller.text = picked.format(context).toString();
      });
    }
  }

  void hanldeBackPre(BuildContext context) {
    context.pop();
  }

  void addSchedule() {
    if (_formKey.currentState!.validate()) {
      DateEntity addDate = DateEntity(
        day: _datePicked.day.toString(),
        month: _datePicked.month.toString(),
        year: _datePicked.year.toString(),
      );
      ScheduleEntity scheduleEntity = ScheduleEntity(
        title: _titleController.text,
        dateTime: addDate,
        beginTime: _beginTimeController.text,
        finishTime: _finishTimeController.text,
      );
      addScheduleSolve(addDate, scheduleEntity);
      print("da them ");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Da them thanh cong!")));
    }
  }

  String? validate(String? message) {
    if (message == "" || message == null) {
      return "Khong duoc bo trong field!";
    }
    return null;
  }

  TimeOfDay _parseTime(String timeString) {
    final List<String> parts = timeString.split(' ');
    final List<String> timeParts = parts[0].split(':');
    int hour = int.parse(timeParts[0]);
    int minute = int.parse(timeParts[1]);
    if (parts.length > 1) {
      final isPM = parts[1].toLowerCase() == 'pm';
      if (isPM && hour < 12) {
        hour += 12;
      } else if (!isPM && hour == 12) {
        hour = 0;
      }
    }
    return TimeOfDay(hour: hour, minute: minute);
  }

  @override
  void initState() {
    super.initState();

    _dateController.text = DateFormat.yMMMMEEEEd().format(selectedDate);
  }

  @override
  void dispose() {
    super.dispose();
    _dateController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 235, 243),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              _title(context),
              const SizedBox(
                height: 40,
              ),
              _formSetDate(context),
              const SizedBox(
                height: 40,
              ),
              _addButton()
            ],
          ),
        ),
      ),
    );
  }

  InkWell _addButton() {
    return InkWell(
      splashColor: null,
      // onTap: () => addSchedule(),
      onTap: () {
        TimeOfDay timeOfDay = _parseTime(_beginTimeController.text);

        LocalNotifications.showScheduleNotification(
          title: _titleController.text,
          body: _titleController.text,
          payload: _titleController.text,
          dateTime: DateTime.now().add(Duration(seconds: 10)),
          // dateTime: DateTime(_datePicked.year, _datePicked.month, _datePicked.day, timeOfDay.hour, timeOfDay.minute),
        );
        // LocalNotifications.showPeriodicNotifications(body: "Ok", payload: "ok", title: "qua oke");
        // LocalNotifications.showSimpleNotification(body: "dd", payload: "dfdf", title: "ioi");
        print("timeOfDay.hour");
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: mainColor,
          gradient: const LinearGradient(
            colors: [mainColor, Color.fromARGB(255, 185, 204, 238)],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
            child: Text(
          "Add",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        )),
      ),
    );
  }

  Padding _formSetDate(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Title",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _titleController,
              validator: (value) => validate(value),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Date",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              validator: (value) => validate(value),

              readOnly: true,
              controller: _dateController,
              // initialValue: _dateController.text,
              decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.calendar_month_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),

              onTap: () async {
                showPickerDate(context);
              },
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Begin",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (value) => validate(value),

                        readOnly: true,
                        controller: _beginTimeController,
                        // initialValue: _dateController.text,
                        decoration: InputDecoration(
                            suffixIcon: const Icon(Icons.watch_later_rounded),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),

                        onTap: () async {
                          showPickerTime(context, _beginTimeController);
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Finish",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (value) => validate(value),
                        readOnly: true,
                        controller: _finishTimeController,
                        // initialValue: _dateController.text,
                        decoration: InputDecoration(
                            suffixIcon: const Icon(Icons.watch_later_rounded),
                            // suffixIcon: const Icon(Icons.calendar_month_outlined),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),

                        onTap: () async {
                          showPickerTime(context, _finishTimeController);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Padding _title(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => hanldeBackPre(context),
            child: SvgPicture.asset(
              SvgIcon.arrowPreCircle,
              width: 30,
            ),
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Be productive",
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
              Text(
                "Add schedule",
                style: TextStyle(color: Colors.black, fontSize: 30),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
