import 'package:covidinfo/database/country_coordinates_dao.dart';
import 'package:covidinfo/database/worldometers_dao.dart';
import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'moor_database.g.dart';

@UseMoor(
    tables: [WorldometersLocals, CountryCoordinatesLocals], daos: [WorldometersLocalDao, CountryCoordinatesLocalDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super((FlutterQueryExecutor.inDatabaseFolder(
          path: 'covidInfo.sqlite',
          logStatements: false,
        )));

  @override
  int get schemaVersion => 1;
}
