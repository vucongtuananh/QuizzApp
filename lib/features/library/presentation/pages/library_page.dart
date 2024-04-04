import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quizz_app/core/constant/constant_value.dart';
import 'package:quizz_app/features/home/presentation/widgets/types_card_study.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
          body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
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
            ),
          ];
        },
        body: TabBarView(children: [
          _studyTab(_size),
          const Center(
            child: Text("Nothing here"),
          )
        ]),
      )),
    );
  }

  SingleChildScrollView _studyTab(Size _size) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: _size.height * 0.02,
          ),
          Container(
            margin: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            // width: _size.width * 0.5,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Find your collections",
              ),
            ),
          ),
          SizedBox(
            height: _size.height * 0.02,
          ),
          TypesOfCardStudy(size: _size, typeCard: 'Phổ biến'),
          SizedBox(
            height: _size.height * 0.02,
          ),
          TypesOfCardStudy(size: _size, typeCard: 'Đề xuất'),
          SizedBox(
            height: _size.height * 0.02,
          ),
          TypesOfCardStudy(size: _size, typeCard: 'Đánh giá cao'),
        ],
      ),
    );
  }

  Padding _titleHeader() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Library",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SvgPicture.asset(
            SvgIcon.searchIcon,
            width: 20,
          ),
        ],
      ),
    );
  }
}
