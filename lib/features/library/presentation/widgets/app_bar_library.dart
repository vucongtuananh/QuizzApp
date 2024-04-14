import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quizz_app/core/constant/constant_value.dart';

class AppBarLibrary extends StatelessWidget {
  const AppBarLibrary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text('Library'),
      actions: [
        Padding(
          padding: const EdgeInsets.only(
            right: 20,
          ),
          child: SvgPicture.asset(
            SvgIcon.searchIcon,
            width: 20,
          ),
        )
      ],
      pinned: true,
      floating: true,
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Align(
          alignment: Alignment.centerLeft,
          child: TabBar(
            dividerColor: Colors.transparent,
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            tabs: [
              Tab(child: Text('Study')),
              Tab(child: Text('Class')),
            ],
          ),
        ),
      ),
    );
  }
}
