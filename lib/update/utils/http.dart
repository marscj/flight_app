import 'package:dio/dio.dart';
import 'package:saadiyat/update/utils/toast.dart';

/// 网络请求工具类
class HttpUtils {
  HttpUtils._internal();

  static Dio sDio;

  ///全局初始化
  static init(
      {String baseUrl, int timeout = 5000, Map<String, dynamic> headers}) {
    sDio = Dio(BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: timeout,
        sendTimeout: timeout,
        receiveTimeout: timeout,
        headers: headers));
    //添加拦截器
    sDio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      print("请求之前");
      return options;
    }, onResponse: (Response response) {
      print("响应之前");
      return response;
    }, onError: (DioError e) {
      print("错误之前");
      handleError(e);
      return e;
    }));
  }

  ///error统一处理
  static void handleError(DioError e) {
    switch (e.type) {
      case DioErrorType.CONNECT_TIMEOUT:
        showError("Connection timed out");
        break;
      case DioErrorType.SEND_TIMEOUT:
        showError("Request timed out");
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        showError("Response time out");
        break;
      case DioErrorType.RESPONSE:
        showError("Error");
        break;
      case DioErrorType.CANCEL:
        showError("Request cancel");
        break;
      default:
        showError("Unknown error");
        break;
    }
  }

  static void showError(String error) {
    print(error);
    ToastUtils.error(error);
  }

  ///get请求
  static Future get(String url, [Map<String, dynamic> params]) async {
    Response response;
    if (params != null) {
      response = await sDio.get(url, queryParameters: params);
    } else {
      response = await sDio.get(url);
    }
    return response.data;
  }

  ///post 表单请求
  static Future post(String url, [Map<String, dynamic> params]) async {
    Response response = await sDio.post(url, queryParameters: params);
    return response.data;
  }

  ///post body请求
  static Future postJson(String url, [Map<String, dynamic> data]) async {
    Response response = await sDio.post(url, data: data);
    return response.data;
  }

  ///下载文件
  static Future downloadFile(String urlPath, String savePath,
      {ProgressCallback onReceiveProgress}) async {
    Response response = await sDio.download(urlPath, savePath,
        onReceiveProgress: onReceiveProgress,
        options: Options(sendTimeout: 25000, receiveTimeout: 25000));
    return response;
  }
}
