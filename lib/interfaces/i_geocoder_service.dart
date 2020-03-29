import 'dart:async';

import 'package:covidinfo/service/error_handler/error_handler.dart';
import 'package:dartz/dartz.dart';
import 'package:geocoder/geocoder.dart';

abstract class IGeocoderService {
  Future<Either<ErrorHandler, Coordinates>> getCountryCoordinates(String countryName);
}
