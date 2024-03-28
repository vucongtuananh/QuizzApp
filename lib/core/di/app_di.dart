import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'app_di.config.dart';

final locator = GetIt.I;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: false,
)
// Future<void> configureDependencies() => init(locator);

Future<void> configureDependencies() => init(locator);
