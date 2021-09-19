import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'model/cat_model.dart';
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
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  model.isBusy
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Text(
                          model.quoteResponse.message,
                        ),
                  SizedBox(
                    height: 50,
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton<CatModel>(
                      items: model.categories
                          .map<DropdownMenuItem<CatModel>>(
                            (e) => DropdownMenuItem<CatModel>(
                              child: Text(e.name),
                              value: e,
                            ),
                          )
                          ?.toList(),
                      onChanged: (value) {
                        model.selectedCategory(value);
                      },
                      hint: Text('Select Category'),
                      value: model.catModel,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    onPressed: () {
                      model.fetchQuote(category: model.catModel.name);
                    },
                    child: Text('Fetch Quote'),
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
