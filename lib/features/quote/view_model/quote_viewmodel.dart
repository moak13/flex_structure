import 'package:flex_structure/features/quote/model/cat_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/error/network_exceptions.dart';
import '../../../core/models/quote_response.dart';
import '../../../core/services/quote_service.dart';
import '../../../locator.dart';

class QuoteViewModel extends BaseViewModel {
  final _quoteService = locator<QuoteService>();
  final _snackbarService = locator<SnackbarService>();

  CatModel _catModel;
  CatModel get catModel => _catModel;

  List<CatModel> _categories = [
    CatModel(name: 'Love'),
    CatModel(name: 'quotes'),
    CatModel(name: 'friendship'),
    CatModel(name: 'Good night'),
    CatModel(name: 'Good morning'),
    CatModel(name: 'funny'),
    CatModel(name: 'Birthday'),
    CatModel(name: 'Sad'),
    CatModel(name: 'Sweet'),
    CatModel(name: 'Random'),
  ];
  List<CatModel> get categories => _categories;

  QuoteResponse _quoteResponse = QuoteResponse(message: '...');
  QuoteResponse get quoteResponse => _quoteResponse;

  fetchQuote({String category}) async {
    setBusy(true);
    final response = await _quoteService.getQuotes(category: category);
    response.when(
      success: (QuoteResponse success) {
        setBusy(false);
        _quoteResponse = success;
        notifyListeners();
      },
      failure: (NetworkExceptions error) {
        setBusy(false);
        _snackbarService.showSnackbar(
          message: NetworkExceptions.getErrorMessage(error),
        );
      },
    );
  }

  selectedCategory(CatModel category) {
    _catModel = category;
    notifyListeners();
  }
}
