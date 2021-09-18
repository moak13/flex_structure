import 'dart:async';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/utils/router.gr.dart';
import '../../../locator.dart';

class SplashViewModel extends BaseViewModel {
  String _title = 'Splash Wahala View';
  String get title => _title;

  final _navigationService = locator<NavigationService>();

  _moveToLoginView() {
    _navigationService.navigateTo(Routes.login_view);
  }

  handleStartUp() async {
    final _duration = Duration(seconds: 5);
    Timer(_duration, _moveToLoginView);
  }
}
