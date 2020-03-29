import 'dart:convert';

import 'package:covidinfo/interfaces/i_news_service.dart';
import 'package:covidinfo/model/news_model.dart';
import 'package:covidinfo/service/error_handler/error_handler.dart';
import 'package:covidinfo/util/constants.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class NewsService implements INewsService {
  Dio dio = new Dio(
    new BaseOptions(
      baseUrl: Constants.newsApiUrl,
      connectTimeout: Constants.connectTimeout,
      receiveTimeout: Constants.receiveTimeout,
      validateStatus: (status) {
        return status <= 500;
      },
    ),
  );

  Dio addInterceptors(Dio dio) {}

  static final NewsService _singleton = new NewsService._internal();

  factory NewsService() {
    return _singleton;
  }

  NewsService._internal() {}

  @override
  Future<Either<ErrorHandler, News>> getNews() async {
    try {
      Response response = await dio.get(
        "/top-headlines?apiKey=${Constants.newsApiKey}&q=covid&sortBy=publishedAt",
      );

      if (response.statusCode == 200) {
        News data = News.fromJson(response.data);
        return Right(data);
      } else {
        final Map<String, dynamic> decodedMessage = json.decode(response.toString());
        return Left(ErrorHandler(response.statusCode, decodedMessage['msg']));
      }
    } on DioError catch (error) {
      return Left(ErrorHandler(500, error.message));
    }
  }
}
