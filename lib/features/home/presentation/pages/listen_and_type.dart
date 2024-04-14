import 'package:flutter/material.dart';
import 'package:quizz_app/core/constant/color_value.dart';

class ListenAndType extends StatefulWidget {
  const ListenAndType({super.key});

  @override
  State<ListenAndType> createState() => _ListenAndTypeState();
}

class _ListenAndTypeState extends State<ListenAndType> {
  void onChange(String input) {}

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text(""),
      ),
      body: Column(
        children: [_title(), _enterAnswer(context)],
      ),
    );
  }

  Widget _enterAnswer(BuildContext context) {
    return Flexible(
        flex: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  color: Color.fromARGB(31, 227, 88, 88),
                  border: Border(
                    bottom: BorderSide(
                      color: mainColor,
                      width: 2,
                    ),
                  )),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Type the answer",
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ));
  }

  Widget _title() {
    return Flexible(
      flex: 1,
      child: const Padding(
        padding: EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Định nghĩa",
              style: TextStyle(
                color: mainColor,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            Text(
              "Home",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
