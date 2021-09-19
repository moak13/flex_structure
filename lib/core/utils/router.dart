import 'package:auto_route/auto_route_annotations.dart';

import '../../features/home/home_view.dart';
import '../../features/login/login_view.dart';
import '../../features/profile/profile_view.dart';
import '../../features/signup/signup_view.dart';
import '../../features/splash/splash_view.dart';

@AdaptiveAutoRouter(routes: <AutoRoute>[
  AdaptiveRoute(page: SplashView, initial: true),
  AdaptiveRoute(page: LoginView, name: 'login_view'),
  AdaptiveRoute(page: SignupView, name: 'signup_view'),
  AdaptiveRoute(page: HomeView, name: 'home_view'),
  AdaptiveRoute(page: ProfileView, name: 'profile_view'),
])
class $Router {}
