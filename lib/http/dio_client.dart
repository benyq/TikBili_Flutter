import 'package:TikBili/business/data/user_storage.dart';
import 'package:TikBili/http/error_message_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANGUAGE = "en";
const String TOKEN = "Bearer token";


class DioClient {
  static final DioClient _instance = DioClient._internal();

  factory DioClient() => _instance;

  late Dio _dio;
  Dio get dio => _dio;

  DioClient._internal() {
    Map<String, String> headers = {
      "Referer": "https://www.bilibili.com/",
      "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
      "Origin": "https://www.bilibili.com/",
      "Accept": "*/*",
      "Accept-Language":"zh-CN,zh;q=0.9,en-US;q=0.8,en;q=0.7"
    };

    var options = BaseOptions(
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
      headers: {},
      responseType: ResponseType.json,
    );

    _dio = Dio(options);
    _dio.interceptors.add(RequestInterceptors());
    if (!kReleaseMode) {
      _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
      ));
    }
  }

  // get请求
  Future<Response> get(String url, {Map<String, dynamic>? parameters, Options? options, CancelToken? cancelToken}) async {
    Options requestOptions = options ?? Options();
    Response response = await _dio.get(url, queryParameters: parameters, options: requestOptions, cancelToken: cancelToken);
    return response;
  }

  // post 请求
  Future<Response> post(String url, {dynamic data, Options? options, CancelToken? cancelToken}) async {
    Options requestOptions = options ?? Options();
    Response response = await _dio.post(url, data: data ?? {}, options: requestOptions, cancelToken: cancelToken);
    return response;
  }
}

/// 拦截
class RequestInterceptors extends Interceptor {
  //

  /// 发送请求
  /// 我们这里可以添加一些公共参数，或者对参数进行加密
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // super.onRequest(options, handler);

    // http header 头加入 cookie
    options.headers['Cookie'] = UserStorage.cookie;

    return handler.next(options);
    // 如果你想完成请求并返回一些自定义数据，你可以resolve一个Response对象 `handler.resolve(response)`。
    // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义response.
    //
    // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象,如`handler.reject(error)`，
    // 这样请求将被中止并触发异常，上层catchError会被调用。
  }

  /// 响应
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // 200 请求成功, 201 添加成功
    if (response.statusCode != 200 && response.statusCode != 201) {
      handler.reject(
        DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        ),
        true,
      );
    } else {
      handler.next(response);
    }
  }

  /// 错误
  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    var exception = err.message ?? "error message";
    switch (err.type) {
      case DioExceptionType.badResponse: // 服务端自定义错误体处理
        {
          final response = err.response;
          final errorMessage = ErrorMessageModel.fromJson(response?.data);
          switch (errorMessage.status) {
            case 401:
              break;
            case 404:
              break;
            case 500:
              break;
            case 502:
              break;
            default:
              break;
          }
        }
        exception = "服务器异常";
        break;
      case DioExceptionType.unknown:
        exception = "未知网络异常";
        break;
      case DioExceptionType.cancel:
        exception = "访问已取消";
        break;
      case DioExceptionType.connectionTimeout:
        exception = "连接超时";
        break;
      default:
        break;
    }
    DioException errNext = err.copyWith(
      message: exception,
    );
    handler.next(errNext);
  }
}
