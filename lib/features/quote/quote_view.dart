import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'view_model/quote_viewmodel.dart';

class QuoteView extends StatelessWidget {
  const QuoteView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<QuoteViewModel>.reactive(
      onModelReady: (model) => model.fetchQuote(),
      viewModelBuilder: () => QuoteViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          body: model.isBusy
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Center(
                  child: Text(
                    model.quoteResponse.message,
                  ),
                ),
        );
      },
    );
  }
}
