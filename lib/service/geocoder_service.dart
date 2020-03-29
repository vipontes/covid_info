import 'package:covidinfo/interfaces/i_geocoder_service.dart';
import 'package:covidinfo/service/error_handler/error_handler.dart';
import 'package:dartz/dartz.dart';
import 'package:geocoder/geocoder.dart';

class GeocoderService implements IGeocoderService {
  @override
  Future<Either<ErrorHandler, List<Address>>> getCountryInfo(String countryName) async {
    try {
      var addresses = await Geocoder.local.findAddressesFromQuery(countryName);
      return Right(addresses);
    } catch (e) {
      return Left(ErrorHandler(500, e.toString()));
    }
  }
}
