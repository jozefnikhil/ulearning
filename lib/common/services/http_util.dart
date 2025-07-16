import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/global.dart';

class HttpUtil {
  late Dio dio;
  static final HttpUtil _instance = HttpUtil._internal();

  factory HttpUtil() {
    return _instance;
  }

  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: AppConstants.SERVER_API_URL,
      // connectTimeout: Duration(seconds: 5),
      // receiveTimeout: Duration(seconds: 5),
      headers: {},
      contentType: "application/json; charset=utf-8", // ← corrected here
      responseType: ResponseType.json,
    );

    dio = Dio(options);
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        logPrint: (obj) => log(obj.toString()),
      ),
    );
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // log('app request data ${options.data}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          // log('app response data ${response.data}');
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          // log('app error data $e');
          ErrorEntity errorinfo = createErrorEntity(e);
          onError(errorinfo);
        },
      ),
    );
  }

  Map<String, dynamic>? getAuthorizationHeader() {
    var headers = <String, dynamic>{};
    var accessToken = Global.storageService.getUserToken();
    log(accessToken);
    if (accessToken.isNotEmpty) {
      headers['Authorization'] = 'Bearer $accessToken';
    }

    return headers;
  }

  Future post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }

    try {
      var response = await dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: requestOptions,
      );
      log('Raw response: ${response.toString()}');
      return response.data;
    } on DioException catch (e) {
      log('DioException: ${e.response?.statusCode}');
      log('Response data: ${e.response?.data}');
      log('Error message: ${e.message}');
      rethrow;
    }
  }
}

class ErrorEntity implements Exception {
  int code = -1;
  String message = '';
  ErrorEntity({required this.code, required this.message});

  @override
  String toString() {
    if (message == "") return 'Exception';
    return "Exception $code $message";
  }
}

ErrorEntity createErrorEntity(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return ErrorEntity(code: -1, message: 'Connection timeout');
    case DioExceptionType.sendTimeout:
      return ErrorEntity(code: -1, message: 'Send timed out');
    case DioExceptionType.receiveTimeout:
      return ErrorEntity(code: -1, message: 'Receive timed out');
    case DioExceptionType.badCertificate:
      return ErrorEntity(code: -1, message: 'Bad SSL Certificate');
    case DioExceptionType.badResponse:
      switch (error.response!.statusCode) {
        case 400:
          return ErrorEntity(code: 400, message: 'request syntax error');
        case 401:
          return ErrorEntity(code: 401, message: 'permission denied');
        case 500:
          return ErrorEntity(code: 500, message: 'internal server error');
      }
      return ErrorEntity(code: -1, message: 'Bad Response');
    case DioExceptionType.cancel:
      return ErrorEntity(code: -1, message: 'Server Cancelled it');
    case DioExceptionType.connectionError:
      return ErrorEntity(code: -1, message: 'Connection Error');
    case DioExceptionType.unknown:
      return ErrorEntity(code: -1, message: 'Unknown Error occured');
  }
}

void onError(ErrorEntity einfo) {
  log('error.code-> ${einfo.code} error.message ${einfo.message}');
  switch (einfo.code) {
    case 400:
      log('server syntax error');
      break;
    case 401:
      log('you are denied to continue');
      break;
    case 500:
      log('internal server error');
      break;
    default:
      log('unknown error');
  }
}
