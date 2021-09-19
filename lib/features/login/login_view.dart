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
          body: SafeArea(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Login View'),
                  SizedBox(
                    height: 50,
                  ),
                  RaisedButton(
                    onPressed: () {
                      model.moveToQuoteView();
                    },
                    child: Text('Quote View'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
