// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';

import '../../features/home/home_view.dart';
import '../../features/login/login_view.dart';
import '../../features/signup/signup_view.dart';
import '../../features/splash/splash_view.dart';

class Routes {
  static const String splashView = '/';
  static const String login_view = '/login-view';
  static const String signup_view = '/signup-view';
  static const String home_view = '/home-view';
  static const all = <String>{
    splashView,
    login_view,
    signup_view,
    home_view,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashView, page: SplashView),
    RouteDef(Routes.login_view, page: LoginView),
    RouteDef(Routes.signup_view, page: SignupView),
    RouteDef(Routes.home_view, page: HomeView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SplashView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const SplashView(),
        settings: data,
      );
    },
    LoginView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const LoginView(),
        settings: data,
      );
    },
    SignupView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const SignupView(),
        settings: data,
      );
    },
    HomeView: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => const HomeView(),
        settings: data,
      );
    },
  };
}
