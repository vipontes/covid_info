import 'dart:async';

import 'package:covidinfo/util/constants.dart';
import 'package:dio/dio.dart';

class AppInterceptors extends Interceptor {
  @override
  Future onRequest(RequestOptions options) async {
    options.headers.addAll({"token": Constants.apiKey});
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    return super.onError(err);
  }
}
