import 'dart:async';

import 'package:flutter/material.dart';

class HeaderImage extends StatefulWidget {
  const HeaderImage({
    super.key,
  });

  @override
  State<HeaderImage> createState() => _HeaderImageState();
}

class _HeaderImageState extends State<HeaderImage> {
  List<Widget> listImageHeader = [
    Image.asset('assets/images/image/img1.png'),
    Image.asset('assets/images/image/img2.jpg'),
  ];
  int _currentPage = 0;
  Timer? timer;
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < listImageHeader.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeInCubic,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: _size.width,
        height: _size.height * 0.4,
        child: PageView.builder(
          controller: _pageController,
          itemBuilder: (context, index) {
            return listImageHeader[index];
          },
          itemCount: listImageHeader.length,
          onPageChanged: (value) {
            // setState(() {
            //   _currentPage = value;
            // });
          },
        ),
      ),
    );
  }
}
