import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'app_di.config.dart';

final locator = GetIt.I;

@InjectableInit(
  initializerName: 'init',
)
Future<void> configureDependencies() async {
  locator.registerSingleton<Dio>(Dio());

  locator.init();
}
