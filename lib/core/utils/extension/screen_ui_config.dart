import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class ResponsiveUIConfig {
  late MediaQueryData _mediaQueryData;
  late double _screenWidth;
  late double _screenHeight;

  double get screenWidth => _screenWidth;
  double get screenHeight => _screenHeight;

  void initialize(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    _screenWidth = _mediaQueryData.size.width;
    _screenHeight = _mediaQueryData.size.height;
  }

  double setHeight(num value) => _screenHeight * (value / 812); // the normal device's height
  double setWidth(num value) => _screenWidth * (value / 375);
}
