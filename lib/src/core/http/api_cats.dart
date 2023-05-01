import 'package:dio/dio.dart';


class ApiCatsInterceptor extends Interceptor {
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers.addAll({'x-api-key': 'bda53789-d59e-46cd-9bc4-2936630fde39'});
    
    return super.onRequest(options, handler);
  }
}


class ApiCatsProvider {
  Dio? dio;

  ApiCatsProvider() {
    dio = Dio(BaseOptions(baseUrl: 'https://api.thecatapi.com/v1'));
    dio?.interceptors.add(ApiCatsInterceptor());
  }
}