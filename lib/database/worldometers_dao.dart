import 'package:moor_flutter/moor_flutter.dart';

import 'moor_database.dart';

part 'worldometers_dao.g.dart';

class WorldometersLocals extends Table {
  IntColumn get worldometers_id => integer()();
  TextColumn get measurement_date => text()();
  TextColumn get country => text()();
  IntColumn get total_cases => integer()();
  IntColumn get new_cases => integer()();
  IntColumn get total_deaths => integer()();
  IntColumn get new_deaths => integer()();
  IntColumn get total_recovered => integer()();
  IntColumn get active_cases => integer()();
  IntColumn get serious_cases => integer()();
  RealColumn get cases_per_million => real()();
  RealColumn get deaths_per_million => real()();

  @override
  Set<Column> get primaryKey => {worldometers_id};
}

@UseDao(tables: [WorldometersLocals])
class WorldometersLocalDao extends DatabaseAccessor<AppDatabase> with _$WorldometersLocalDaoMixin {
  WorldometersLocalDao(AppDatabase db) : super(db);

  Future<List<WorldometersLocal>> getDataByDate(String selectedDate) =>
      (select(worldometersLocals)..where((w) => w.measurement_date.equals(selectedDate))).get();
  Future insertItem(WorldometersLocal data) => into(worldometersLocals).insert(data);
  Future updateItem(WorldometersLocal data) => update(worldometersLocals).replace(data);
  Future deleteItem(WorldometersLocal data) => delete(worldometersLocals).delete(data);
  Future cleanSelectedDate(String selectedDate) =>
      (delete(worldometersLocals)..where((w) => w.measurement_date.equals(selectedDate))).go();
}
