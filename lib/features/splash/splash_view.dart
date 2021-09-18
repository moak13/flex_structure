import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'view_model/splash_viewmodel.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      onModelReady: (model) => model.handleStartUp(),
      viewModelBuilder: () => SplashViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          body: Center(
            child: Text(
              model.title,
            ),
          ),
        );
      },
    );
  }
}
