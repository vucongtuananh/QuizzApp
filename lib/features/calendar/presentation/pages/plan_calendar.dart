import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:quizz_app/core/constant/color_value.dart';
import 'package:quizz_app/core/constant/constant_value.dart';

class PlannerCalendar extends StatefulWidget {
  const PlannerCalendar({super.key});

  @override
  State<PlannerCalendar> createState() => _PlannerCalendarState();
}

class _PlannerCalendarState extends State<PlannerCalendar> {
  final TextEditingController _dateController = TextEditingController();
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
      print("hien loi de");
    }
  }

  String? validate(String? message) {
    if (message == "" || message == null) {
      return "Khong duoc bo trong field!";
    }
    return null;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _dateController.text = DateFormat.MMMMEEEEd().format(selectedDate);
    _dateController.text = DateFormat.yMMMMEEEEd().format(selectedDate);
  }

  @override
  void dispose() {
    // TODO: implement dispose
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
      onTap: () => addSchedule(),
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
