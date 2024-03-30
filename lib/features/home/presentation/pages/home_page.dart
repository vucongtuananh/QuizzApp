import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quizz_app/features/home/presentation/widgets/types_card_study.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> listImageHeader = [
    Image.asset('assets/images/image/img1.png'),
    Image.asset('assets/images/image/img2.jpg'),
  ];
  int _currentPage = 0;
  Timer? _timer;
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 2), (Timer timer) {
      if (_currentPage < listImageHeader.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    Widget homeWidget = Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildImageHeader(_size),
            SizedBox(
              height: _size.height * 0.05,
            ),
            TypesOfCardStudy(size: _size, typeCard: 'Phổ biến'),
            SizedBox(
              height: _size.height * 0.05,
            ),
            TypesOfCardStudy(size: _size, typeCard: 'Đề xuất'),
            SizedBox(
              height: _size.height * 0.05,
            ),
            TypesOfCardStudy(size: _size, typeCard: 'Đánh giá cao'),
          ],
        ),
      ),
    );
    // homeWidget = BlocListener<AuthBloc, AuthState>(
    //   listener: (context, state) {
    //     if (state is AuthLogoutSuccessState) {
    //       context.read<AuthBloc>().add(AuthStartEvent());
    //       context.pushReplacement(AppRouter.login);
    //     }
    //   },
    //   child: homeWidget,
    // );
    return homeWidget;
  }

  Widget _buildImageHeader(Size _size) {
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
            setState(() {
              _currentPage = value;
            });
          },
        ),
      ),
    );
  }
}
