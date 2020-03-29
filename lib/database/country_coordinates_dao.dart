import 'package:moor_flutter/moor_flutter.dart';

import 'moor_database.dart';

part 'country_coordinates_dao.g.dart';

class CountryCoordinatesLocals extends Table {
  TextColumn get country => text()();
  RealColumn get latitude => real()();
  RealColumn get longitude => real()();

  @override
  Set<Column> get primaryKey => {country};
}

@UseDao(tables: [CountryCoordinatesLocals])
class CountryCoordinatesLocalDao extends DatabaseAccessor<AppDatabase> with _$CountryCoordinatesLocalDaoMixin {
  CountryCoordinatesLocalDao(AppDatabase db) : super(db);

  Future<CountryCoordinatesLocal> getCountry(String country) =>
      (select(countryCoordinatesLocals)..where((x) => x.country.equals(country))).getSingle();
  Future insertItem(CountryCoordinatesLocal data) => into(countryCoordinatesLocals).insert(data);
  Future updateItem(CountryCoordinatesLocal data) => update(countryCoordinatesLocals).replace(data);
  Future deleteItem(CountryCoordinatesLocal data) => delete(countryCoordinatesLocals).delete(data);
}
