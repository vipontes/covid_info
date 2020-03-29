import 'dart:async';

import 'package:covidinfo/model/news_model.dart';
import 'package:covidinfo/service/error_handler/error_handler.dart';
import 'package:dartz/dartz.dart';

abstract class INewsService {
  Future<Either<ErrorHandler, News>> getNews();
}
