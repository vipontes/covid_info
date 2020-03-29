import 'package:covidinfo/database/moor_database.dart';
import 'package:covidinfo/interfaces/i_geocoder_service.dart';
import 'package:covidinfo/main.dart';
import 'package:covidinfo/service/error_handler/error_handler.dart';
import 'package:dartz/dartz.dart';
import 'package:geocoder/geocoder.dart';
import 'package:provider/provider.dart';

class GeocoderService implements IGeocoderService {
  @override
  Future<Either<ErrorHandler, Coordinates>> getCountryCoordinates(String countryName) async {
    final database = Provider.of<AppDatabase>(navigatorKey.currentContext);
    CountryCoordinatesLocal localData = await database.countryCoordinatesLocalDao.getCountry(countryName);

    if (localData != null) {
      Coordinates coordinates = Coordinates(localData.latitude, localData.longitude);
      return Right(coordinates);
    } else {
      try {
        var addresses = await Geocoder.local.findAddressesFromQuery(countryName);

        if (addresses.length > 0) {
          var coordinates = addresses[0].coordinates;

          CountryCoordinatesLocal countryCoordinatesLocal = CountryCoordinatesLocal(
              country: countryName, latitude: coordinates.latitude, longitude: coordinates.longitude);
          database.countryCoordinatesLocalDao.insertItem(countryCoordinatesLocal);

          return Right(coordinates);
        } else {
          return Left(ErrorHandler(500, "Error"));
        }
      } catch (e) {
        return Left(ErrorHandler(500, e.toString()));
      }
    }
  }
}
