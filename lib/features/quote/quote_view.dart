import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'view_model/quote_viewmodel.dart';

class QuoteView extends StatelessWidget {
  const QuoteView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<QuoteViewModel>.reactive(
      viewModelBuilder: () => QuoteViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          body: Center(
            child: Text(
              'Quote View',
            ),
          ),
        );
      },
    );
  }
}
