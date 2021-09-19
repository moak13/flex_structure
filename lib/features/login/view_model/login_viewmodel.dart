import 'package:flex_structure/core/utils/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../locator.dart';

class LoginViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  moveToQuoteView() {
    _navigationService.navigateTo(Routes.quote_view);
  }
}
