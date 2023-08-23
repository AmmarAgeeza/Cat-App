import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../error/error_model.dart';
import '../../error/exceptions.dart';
import '../../services/service_locator.dart';
import 'api_consumer.dart';
import 'end_points.dart';
import 'status_code.dart';

class DioConsumer extends ApiConsumer {
  final Dio client;
  DioConsumer({
    required this.client,
  }) {
    client.options
      ..baseUrl = EndPoints.baseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = false;

    if (kDebugMode) {
      client.interceptors.add(sl<LogInterceptor>());
    }
  }

  @override
  Future<dynamic> get(String path,
      {Map<String, dynamic>? queryParameters,
      Map<String, String>? headers}) async {
    try {
      final response = await client.get(
        path,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );
      return decodeResponse(response);
    } on DioException catch (error) {
      _handleDioError(error);
    }
  }

  dynamic decodeResponse(Response response) {
    return jsonDecode(response.data.toString());
  }

  dynamic _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.badCertificate:
      case DioExceptionType.connectionError:
        throw const FetchDataException(
            ErrorMessageModel(statusMessage: 'connectionError'));
      case DioExceptionType.badResponse:
        switch (error.response?.statusCode) {
          case StatusCode.notFound:
            throw NotFoundException(
                ErrorMessageModel.fromJson(jsonDecode(error.response!.data)));
          case StatusCode.unauthorized:
          case StatusCode.forbidden:
            throw UnauthorizedException(
                ErrorMessageModel.fromJson(jsonDecode(error.response!.data)));
          case StatusCode.badRequest:
            throw BadRequestException(
                ErrorMessageModel.fromJson(jsonDecode(error.response!.data)));
          case StatusCode.conflict:
            throw ConflictException(
                ErrorMessageModel.fromJson(jsonDecode(error.response!.data)));
          case StatusCode.internalServerError:
            throw InternalServerErrorException(
                ErrorMessageModel.fromJson(decodeResponse(error.response!)));
        }
        break;
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.unknown:
        throw const NoInternetConnectionException(
            ErrorMessageModel(statusMessage: 'No'));
    }
  }
}
