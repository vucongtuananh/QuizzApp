import 'package:quizz_app/core/utils/extension/screen_ui_config.dart';

extension ExtensionOnNum on num {
  static final ResponsiveUIConfig _responsiveUIConfig = ResponsiveUIConfig();

  double get w => _responsiveUIConfig.setWidth(this);
  double get h => _responsiveUIConfig.setHeight(this);
}
