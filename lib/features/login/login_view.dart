import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'view_model/login_viewmodel.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          body: Center(
            child: Text(
              'Login View',
            ),
          ),
        );
      },
    );
  }
}
