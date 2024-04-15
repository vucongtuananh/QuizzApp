import 'package:flutter/material.dart';
import 'package:quizz_app/features/library/presentation/widgets/app_bar_library.dart';
import 'package:quizz_app/features/library/presentation/widgets/library_study_tab.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            const AppBarLibrary(),
          ];
        },
        body: const TabBarView(children: [
          LibraryStudyTab(),
          Center(
            child: Text("Nothing here"),
          )
        ]),
      )),
    );
  }
}
