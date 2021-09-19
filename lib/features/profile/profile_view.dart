import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'view_model/profile_viewmodel.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      viewModelBuilder: () => ProfileViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          body: Center(
            child: Text(
              'Profile View',
            ),
          ),
        );
      },
    );
  }
}
