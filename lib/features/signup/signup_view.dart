import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'view_model/signup_viewmodel.dart';

class SignupView extends StatelessWidget {
  const SignupView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignupViewModel>.reactive(
      viewModelBuilder: () => SignupViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          body: Center(
            child: Text(
              'Signup View',
            ),
          ),
        );
      },
    );
  }
}
