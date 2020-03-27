import 'dart:async';

import 'package:covidinfo/model/worldometer_model.dart';
import 'package:covidinfo/service/error_handler/error_handler.dart';
import 'package:dartz/dartz.dart';

abstract class IWorldometerService {
  Future<Either<ErrorHandler, List<Worldometer>>> getInfo(String selectedDate);
}
