import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quizz_app/core/constant/constant_value.dart';
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
      backgroundColor: Color.fromARGB(255, 250, 250, 250),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: false,
            pinned: true,
            // pinned: false,
            // snap: true,
            backgroundColor: Colors.blueAccent,
            stretch: true,
            onStretchTrigger: () async {
              // Triggers when stretching
            },
            // [stretchTriggerOffset] describes the amount of overscroll that must occur
            // to trigger [onStretchTrigger]
            //
            // Setting [stretchTriggerOffset] to a value of 300.0 will trigger
            // [onStretchTrigger] when the user has overscrolled by 300.0 pixels.
            stretchTriggerOffset: 300.0,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Color.fromARGB(255, 120, 165, 241),
                child: Center(
                  child: _searchBar(_size),
                ),
              ),
              centerTitle: true,
              title: const Text(
                'F L U X Q U I Z',
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildImageHeader(_size),
                SizedBox(
                  height: _size.height * 0.03,
                ),
                TypesOfCardStudy(size: _size, typeCard: 'Phổ biến'),
                SizedBox(
                  height: _size.height * 0.03,
                ),
                TypesOfCardStudy(size: _size, typeCard: 'Đề xuất'),
                SizedBox(
                  height: _size.height * 0.03,
                ),
              ],
            ),
          ),
        ],
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

  Row _searchBar(Size _size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 20,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              SizedBox(
                width: _size.width * 0.6,
                height: _size.height * 0.05,
                child: const TextField(
                  decoration: InputDecoration(border: InputBorder.none, hintText: "Study, sets, questions"),
                ),
              ),
              SvgPicture.asset(
                SvgIcon.searchIcon,
                width: 20,
                height: 20,
              ),
              SizedBox(
                width: 8,
              )
            ],
          ),
        ),
        SvgPicture.asset(SvgIcon.bellIcon),
      ],
    );
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
