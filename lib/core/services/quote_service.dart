import '../models/quote_response.dart';
import '../utils/access_point.dart';
import '../utils/api_result.dart';
import 'base_service.dart';

abstract class QuoteService {
  Future<ApiResult<QuoteResponse>> getQuotes({String category});
}

class QuoteServiceImpl extends BaseService implements QuoteService {
  @override
  Future<ApiResult<QuoteResponse>> getQuotes({String category}) {
    return get<QuoteResponse>(
      url: AccessPoint.getMessage,
      converter: (json) => QuoteResponse.fromJson(json),
      queryParameters: {"Category": category},
    );
  }
}
