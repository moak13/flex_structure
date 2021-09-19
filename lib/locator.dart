import 'package:get_it/get_it.dart';
import 'package:stacked_services/stacked_services.dart';

import 'core/services/quote_service.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => StackedService());
  locator.registerLazySingleton<QuoteService>(() => QuoteServiceImpl());
}
