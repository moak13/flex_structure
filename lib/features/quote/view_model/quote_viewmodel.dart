import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../core/error/network_exceptions.dart';
import '../../../core/models/quote_response.dart';
import '../../../core/services/quote_service.dart';
import '../../../locator.dart';

class QuoteViewModel extends BaseViewModel {
  final _quoteService = locator<QuoteService>();
  final _snackbarService = locator<SnackbarService>();

  QuoteResponse _quoteResponse;
  QuoteResponse get quoteResponse => _quoteResponse;

  fetchQuote() async {
    setBusy(true);
    final response = await _quoteService.getQuotes();
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
}
