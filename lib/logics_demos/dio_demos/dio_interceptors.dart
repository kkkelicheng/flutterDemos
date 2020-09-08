import 'package:dio/dio.dart';

//通过拦截器你可以在请求之前或响应之后(但还没有被 then 或 catchError处理)做一些统一的预处理操作
class CustomInterceptors extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) {
    print("REQUEST[${options?.method}] => PATH: ${options?.path}");
    return super.onRequest(options);
  }
  @override
  Future onResponse(Response response) {
    print("RESPONSE[${response?.statusCode}] => PATH: ${response?.request?.path}");
    return super.onResponse(response);
  }
  @override
  Future onError(DioError err) {
    print("ERROR[${err?.response?.statusCode}] => PATH: ${err?.request?.path}");
    return super.onError(err);
  }
}

/*
直接使用实例初始化

dio.interceptors.add(InterceptorsWrapper(
    onRequest:(RequestOptions options) async {
     // 在请求被发送之前做一些事情
     return options; //continue
     // 如果你想完成请求并返回一些自定义数据，可以返回一个`Response`对象或返回`dio.resolve(data)`。
     // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义数据data.
     //
     // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象，或返回`dio.reject(errMsg)`，
     // 这样请求将被中止并触发异常，上层catchError会被调用。
    },
    onResponse:(Response response) async {
     // 在返回响应数据之前做一些预处理
     return response; // continue
    },
    onError: (DioError e) async {
      // 当请求失败时做一些预处理
     return e;//continue
    }
));
*/

/*
继承以后使用的拦截器
pub pretty_dio_logger

Dio dio = Dio();
dio.interceptors.add(PrettyDioLogger());
// customization
   dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
 */