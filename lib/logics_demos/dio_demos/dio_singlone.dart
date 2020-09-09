import 'package:dio/dio.dart';
import 'package:dio_flutter_transformer/dio_flutter_transformer.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'dio_baseModel.dart';
import 'dio_configs.dart';
import 'dio_error.dart';

class DioManager {
  factory DioManager() => _getInstance();
  static DioManager _instance;
  static Dio _dio;

  DioManager._config() {
    //do something...
    _dio = Dio();
    _dio.interceptors
        .add(PrettyDioLogger(requestHeader: true, requestBody: true));
  }

  static DioManager _getInstance() {
    if (_instance == null) {
      _instance = DioManager._config();
    }
    return _instance;
  }

  void _handleDioConfig() {
    _dio.options = DioConfigs.baseOptions();
    _dio.transformer = FlutterTransformer();
  }

  Future<BaseEntity> _handleResponse(Response response) {
    if (response != null) {
      BaseEntity entity = BaseEntity.fromJson(response.data);
      if (entity.code == 200) {
        return Future.value(entity).then((value) => null);
      } else {
        return Future.error(
            ErrorEntity(code: entity.code, message: entity.message));
      }
    } else {
      return Future.error(ErrorEntity(code: -1, message: "未知错误"));
    }
  }
}

extension DioRequest on DioManager {
// path：请求地址
  // params：请求参数
  // success：请求成功回调
  // error：请求失败回调
  Future<BaseEntity> get(String path, {Map<String, dynamic> params}) async {
    _handleDioConfig();
    try {
      Response response =
          await DioManager._dio.get(path, queryParameters: params);
      return _handleResponse(response);
    } catch (e) {
      return Future.error(ErrorEntity.createErrorEntity(e));
    }
  }

  Future post(String path, Map<String, dynamic> params) async {
    _handleDioConfig();
    try {
      Response response =
          await DioManager._dio.post(path, queryParameters: params);
      return _handleResponse(response);
    } catch (e) {
      return Future.error(ErrorEntity.createErrorEntity(e));
    }
  }
}
