import 'dart:async';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/foundation.dart';

import '../utils/access_point.dart';

// import '../utils/token_manager.dart';

const _defaultConnectTimeout = Duration.millisecondsPerMinute;
const _defaultReceiveTimeout = Duration.millisecondsPerMinute;

class DioClient {
  Dio _dio;

  final List<Interceptor> interceptors;

  DioClient({
    this.interceptors,
  }) {
    _dio = Dio();
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    _dio
      ..options.baseUrl = AccessPoint.baseURL
      ..options.connectTimeout = _defaultConnectTimeout
      ..options.receiveTimeout = _defaultReceiveTimeout
      ..httpClientAdapter;
    if (interceptors?.isNotEmpty ?? false) {
      _dio.interceptors.add(DioCacheManager(CacheConfig(
        defaultMaxAge: Duration(days: 10),
        maxMemoryCacheCount: 3,
      )).interceptor);
      _dio.interceptors.addAll(interceptors);
    }
    if (kDebugMode) {
      _dio.interceptors.add(LogInterceptor(
          responseBody: true,
          error: true,
          requestHeader: true,
          responseHeader: false,
          request: false,
          requestBody: true));
    }
  }

  Future<Options> _getDioHeader() async {
    return Options(
      headers: {
        'x-rapidapi-host': 'ajith-messages.p.rapidapi.com',
        'x-rapidapi-key': '97e61ab42cmshd978ed66e241013p142adbjsncc6d58aac614'
      },
    );
  }

  Future<dynamic> get(
    String uri, {
    Map<String, dynamic> queryParameters,
    CancelToken cancelToken,
    ProgressCallback onReceiveProgress,
  }) async {
    try {
      var response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: await _getDioHeader(),
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> post(
    String uri, {
    data,
    Map<String, dynamic> queryParameters,
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    try {
      var response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: await _getDioHeader(),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> patch(
    String uri, {
    data,
    Map<String, dynamic> queryParameters,
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    try {
      var response = await _dio.patch(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: await _getDioHeader(),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> put(
    String uri, {
    data,
    Map<String, dynamic> queryParameters,
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    try {
      var response = await _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: await _getDioHeader(),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> delete(
    String uri, {
    data,
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
  }) async {
    try {
      var response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: await _getDioHeader(),
        cancelToken: cancelToken,
      );
      return response.data;
    } catch (e) {
      throw e;
    }
  }
}
