import 'dart:async';
import 'dart:io';

// import 'package:citizen_mata_mobile/core/model/error_response.dart';
import 'package:dio/dio.dart';
import 'package:flex_structure/core/models/error_response.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:stacked_services/stacked_services.dart';

part 'network_exceptions.freezed.dart';

@freezed
abstract class NetworkExceptions with _$NetworkExceptions {
  const factory NetworkExceptions.requestCancelled() = RequestCancelled;

  const factory NetworkExceptions.unauthorizedRequest() = UnauthorizedRequest;

  const factory NetworkExceptions.badRequest() = BadRequest;

  const factory NetworkExceptions.notFound(String reason) = NotFound;

  const factory NetworkExceptions.methodNotAllowed() = MethodNotAllowed;

  const factory NetworkExceptions.notAcceptable() = NotAcceptable;

  const factory NetworkExceptions.requestTimeout() = RequestTimeout;

  const factory NetworkExceptions.sendTimeout() = SendTimeout;

  const factory NetworkExceptions.conflict() = Conflict;

  const factory NetworkExceptions.internalServerError() = InternalServerError;

  const factory NetworkExceptions.notImplemented() = NotImplemented;

  const factory NetworkExceptions.serviceUnavailable() = ServiceUnavailable;

  const factory NetworkExceptions.noInternetConnection() = NoInternetConnection;

  const factory NetworkExceptions.formatException() = FormatException;

  const factory NetworkExceptions.unableToProcess() = UnableToProcess;

  const factory NetworkExceptions.defaultError(String error) = DefaultError;

  const factory NetworkExceptions.unexpectedError() = UnexpectedError;

  static NetworkExceptions handleResponse(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
      case 400:
        return NetworkExceptions.defaultError('');
        // ErrorResponse.fromJson(response.data).message);
        break;
      case 401:
        return NetworkExceptions.defaultError(
            ErrorResponse.fromJson(response.data).message);
        return null;
      case 403:
        return NetworkExceptions.unauthorizedRequest();
        break;
      case 404:
        return NetworkExceptions.notFound("Not found");
        break;
      case 409:
        return NetworkExceptions.conflict();
        break;
      case 408:
        return NetworkExceptions.requestTimeout();
        break;
      case 500:
        return NetworkExceptions.internalServerError();
        break;
      case 503:
        return NetworkExceptions.serviceUnavailable();
        break;
      default:
        var responseCode = response.statusCode;
        return NetworkExceptions.defaultError(
          "Received invalid status code: $responseCode",
        );
    }
  }

  static NetworkExceptions getDioException(error) {
    if (error is Exception) {
      try {
        NetworkExceptions networkExceptions;
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.CANCEL:
              networkExceptions = NetworkExceptions.requestCancelled();
              break;
            case DioErrorType.CONNECT_TIMEOUT:
              networkExceptions = NetworkExceptions.requestTimeout();
              break;
            case DioErrorType.DEFAULT:
              networkExceptions = NetworkExceptions.noInternetConnection();
              break;
            case DioErrorType.RECEIVE_TIMEOUT:
              networkExceptions = NetworkExceptions.sendTimeout();
              break;
            case DioErrorType.RESPONSE:
              networkExceptions =
                  NetworkExceptions.handleResponse(error.response);
              break;
            case DioErrorType.SEND_TIMEOUT:
              networkExceptions = NetworkExceptions.sendTimeout();
              break;
          }
        } else if (error is SocketException) {
          networkExceptions = NetworkExceptions.noInternetConnection();
        } else if (error is TimeoutException) {
          networkExceptions = NetworkExceptions.requestTimeout();
        } else if (error is HttpException) {
          networkExceptions = NetworkExceptions.notImplemented();
        } else {
          networkExceptions = NetworkExceptions.unexpectedError();
        }
        return networkExceptions;
      } on FormatException catch (e) {
        // Helper.printError(e.toString());
        return NetworkExceptions.formatException();
      } catch (e) {
        debugPrint('NetworkError: $e');
        return NetworkExceptions.unexpectedError();
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return NetworkExceptions.unableToProcess();
      } else {
        return NetworkExceptions.unexpectedError();
      }
    }
  }

  static String getErrorMessage(NetworkExceptions networkExceptions) {
    var errorMessage = "";
    networkExceptions.when(notImplemented: () {
      errorMessage = "Not Implemented";
    }, requestCancelled: () {
      errorMessage = "Request Cancelled";
    }, internalServerError: () {
      errorMessage = "Internal Server Error";
    }, notFound: (String reason) {
      errorMessage = reason;
    }, serviceUnavailable: () {
      errorMessage = "Service unavailable";
    }, methodNotAllowed: () {
      errorMessage = "Method Allowed";
    }, badRequest: () {
      errorMessage = "Bad request";
    }, unauthorizedRequest: () {
      errorMessage = "Unauthorized request";
    }, unexpectedError: () {
      errorMessage = "Unexpected error occurred";
    }, requestTimeout: () {
      errorMessage = "Connection request timeout";
    }, noInternetConnection: () {
      errorMessage = "No internet connection";
    }, conflict: () {
      errorMessage = "Error due to a conflict";
    }, sendTimeout: () {
      errorMessage = "Send timeout in connection with API server";
    }, unableToProcess: () {
      errorMessage = "Unable to process the data";
    }, defaultError: (String error) {
      errorMessage = error;
    }, formatException: () {
      errorMessage = "Unexpected error occurred";
    }, notAcceptable: () {
      errorMessage = "Not acceptable";
    });
    return errorMessage;
  }
}
