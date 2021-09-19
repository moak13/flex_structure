import '../error/network_exceptions.dart';
import '../network/dio_client.dart';
import '../utils/api_result.dart';

class BaseService {
  final _dioClient = DioClient();

  Future<ApiResult<T>> post<T>({
    String url,
    dynamic data,
    Map<String, dynamic> queryParameters,
    Function converter,
  }) async {
    try {
      final response = await _dioClient.post(url,
          data: data, queryParameters: queryParameters);
      return ApiResult.success(
        data: converter(response),
      );
    } catch (e) {
      return ApiResult.failure(
        error: NetworkExceptions.getDioException(e),
      );
    }
  }

  Future<ApiResult<T>> get<T>({
    String url,
    Map<String, dynamic> queryParameters,
    Function converter,
  }) async {
    try {
      final response = await _dioClient.get(
        url,
        queryParameters: queryParameters,
      );
      return ApiResult.success(
        data: converter(response),
      );
    } catch (e) {
      return ApiResult.failure(
        error: NetworkExceptions.getDioException(e),
      );
    }
  }

  Future<ApiResult<T>> put<T>({
    String url,
    dynamic data,
    Map<String, dynamic> queryParameters,
    Function converter,
  }) async {
    try {
      final response = await _dioClient.put(url,
          data: data, queryParameters: queryParameters);
      return ApiResult.success(
        data: converter(response),
      );
    } catch (e) {
      return ApiResult.failure(
        error: NetworkExceptions.getDioException(e),
      );
    }
  }

  Future<ApiResult<T>> patch<T>({
    String url,
    dynamic data,
    Map<String, dynamic> queryParameters,
    Function converter,
  }) async {
    try {
      final response = await _dioClient.patch(url,
          data: data, queryParameters: queryParameters);
      return ApiResult.success(
        data: converter(response),
      );
    } catch (e) {
      return ApiResult.failure(
        error: NetworkExceptions.getDioException(e),
      );
    }
  }

  Future<ApiResult<T>> delete<T>({
    String url,
    dynamic data,
    Map<String, dynamic> queryParameters,
    Function converter,
  }) async {
    try {
      final response = await _dioClient.delete(url,
          data: data, queryParameters: queryParameters);
      return ApiResult.success(
        data: converter(response),
      );
    } catch (e) {
      return ApiResult.failure(
        error: NetworkExceptions.getDioException(e),
      );
    }
  }
}
