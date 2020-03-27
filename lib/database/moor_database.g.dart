// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class WorldometersLocal extends DataClass
    implements Insertable<WorldometersLocal> {
  final int worldometers_id;
  final String measurement_date;
  final String country;
  final int total_cases;
  final int new_cases;
  final int total_deaths;
  final int new_deaths;
  final int total_recovered;
  final int active_cases;
  final int serious_cases;
  final double cases_per_million;
  final double deaths_per_million;
  WorldometersLocal(
      {@required this.worldometers_id,
      @required this.measurement_date,
      @required this.country,
      @required this.total_cases,
      @required this.new_cases,
      @required this.total_deaths,
      @required this.new_deaths,
      @required this.total_recovered,
      @required this.active_cases,
      @required this.serious_cases,
      @required this.cases_per_million,
      @required this.deaths_per_million});
  factory WorldometersLocal.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    return WorldometersLocal(
      worldometers_id: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}worldometers_id']),
      measurement_date: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}measurement_date']),
      country:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}country']),
      total_cases: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}total_cases']),
      new_cases:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}new_cases']),
      total_deaths: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}total_deaths']),
      new_deaths:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}new_deaths']),
      total_recovered: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}total_recovered']),
      active_cases: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}active_cases']),
      serious_cases: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}serious_cases']),
      cases_per_million: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}cases_per_million']),
      deaths_per_million: doubleType.mapFromDatabaseResponse(
          data['${effectivePrefix}deaths_per_million']),
    );
  }
  factory WorldometersLocal.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return WorldometersLocal(
      worldometers_id: serializer.fromJson<int>(json['worldometers_id']),
      measurement_date: serializer.fromJson<String>(json['measurement_date']),
      country: serializer.fromJson<String>(json['country']),
      total_cases: serializer.fromJson<int>(json['total_cases']),
      new_cases: serializer.fromJson<int>(json['new_cases']),
      total_deaths: serializer.fromJson<int>(json['total_deaths']),
      new_deaths: serializer.fromJson<int>(json['new_deaths']),
      total_recovered: serializer.fromJson<int>(json['total_recovered']),
      active_cases: serializer.fromJson<int>(json['active_cases']),
      serious_cases: serializer.fromJson<int>(json['serious_cases']),
      cases_per_million: serializer.fromJson<double>(json['cases_per_million']),
      deaths_per_million:
          serializer.fromJson<double>(json['deaths_per_million']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'worldometers_id': serializer.toJson<int>(worldometers_id),
      'measurement_date': serializer.toJson<String>(measurement_date),
      'country': serializer.toJson<String>(country),
      'total_cases': serializer.toJson<int>(total_cases),
      'new_cases': serializer.toJson<int>(new_cases),
      'total_deaths': serializer.toJson<int>(total_deaths),
      'new_deaths': serializer.toJson<int>(new_deaths),
      'total_recovered': serializer.toJson<int>(total_recovered),
      'active_cases': serializer.toJson<int>(active_cases),
      'serious_cases': serializer.toJson<int>(serious_cases),
      'cases_per_million': serializer.toJson<double>(cases_per_million),
      'deaths_per_million': serializer.toJson<double>(deaths_per_million),
    };
  }

  @override
  WorldometersLocalsCompanion createCompanion(bool nullToAbsent) {
    return WorldometersLocalsCompanion(
      worldometers_id: worldometers_id == null && nullToAbsent
          ? const Value.absent()
          : Value(worldometers_id),
      measurement_date: measurement_date == null && nullToAbsent
          ? const Value.absent()
          : Value(measurement_date),
      country: country == null && nullToAbsent
          ? const Value.absent()
          : Value(country),
      total_cases: total_cases == null && nullToAbsent
          ? const Value.absent()
          : Value(total_cases),
      new_cases: new_cases == null && nullToAbsent
          ? const Value.absent()
          : Value(new_cases),
      total_deaths: total_deaths == null && nullToAbsent
          ? const Value.absent()
          : Value(total_deaths),
      new_deaths: new_deaths == null && nullToAbsent
          ? const Value.absent()
          : Value(new_deaths),
      total_recovered: total_recovered == null && nullToAbsent
          ? const Value.absent()
          : Value(total_recovered),
      active_cases: active_cases == null && nullToAbsent
          ? const Value.absent()
          : Value(active_cases),
      serious_cases: serious_cases == null && nullToAbsent
          ? const Value.absent()
          : Value(serious_cases),
      cases_per_million: cases_per_million == null && nullToAbsent
          ? const Value.absent()
          : Value(cases_per_million),
      deaths_per_million: deaths_per_million == null && nullToAbsent
          ? const Value.absent()
          : Value(deaths_per_million),
    );
  }

  WorldometersLocal copyWith(
          {int worldometers_id,
          String measurement_date,
          String country,
          int total_cases,
          int new_cases,
          int total_deaths,
          int new_deaths,
          int total_recovered,
          int active_cases,
          int serious_cases,
          double cases_per_million,
          double deaths_per_million}) =>
      WorldometersLocal(
        worldometers_id: worldometers_id ?? this.worldometers_id,
        measurement_date: measurement_date ?? this.measurement_date,
        country: country ?? this.country,
        total_cases: total_cases ?? this.total_cases,
        new_cases: new_cases ?? this.new_cases,
        total_deaths: total_deaths ?? this.total_deaths,
        new_deaths: new_deaths ?? this.new_deaths,
        total_recovered: total_recovered ?? this.total_recovered,
        active_cases: active_cases ?? this.active_cases,
        serious_cases: serious_cases ?? this.serious_cases,
        cases_per_million: cases_per_million ?? this.cases_per_million,
        deaths_per_million: deaths_per_million ?? this.deaths_per_million,
      );
  @override
  String toString() {
    return (StringBuffer('WorldometersLocal(')
          ..write('worldometers_id: $worldometers_id, ')
          ..write('measurement_date: $measurement_date, ')
          ..write('country: $country, ')
          ..write('total_cases: $total_cases, ')
          ..write('new_cases: $new_cases, ')
          ..write('total_deaths: $total_deaths, ')
          ..write('new_deaths: $new_deaths, ')
          ..write('total_recovered: $total_recovered, ')
          ..write('active_cases: $active_cases, ')
          ..write('serious_cases: $serious_cases, ')
          ..write('cases_per_million: $cases_per_million, ')
          ..write('deaths_per_million: $deaths_per_million')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      worldometers_id.hashCode,
      $mrjc(
          measurement_date.hashCode,
          $mrjc(
              country.hashCode,
              $mrjc(
                  total_cases.hashCode,
                  $mrjc(
                      new_cases.hashCode,
                      $mrjc(
                          total_deaths.hashCode,
                          $mrjc(
                              new_deaths.hashCode,
                              $mrjc(
                                  total_recovered.hashCode,
                                  $mrjc(
                                      active_cases.hashCode,
                                      $mrjc(
                                          serious_cases.hashCode,
                                          $mrjc(
                                              cases_per_million.hashCode,
                                              deaths_per_million
                                                  .hashCode))))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is WorldometersLocal &&
          other.worldometers_id == this.worldometers_id &&
          other.measurement_date == this.measurement_date &&
          other.country == this.country &&
          other.total_cases == this.total_cases &&
          other.new_cases == this.new_cases &&
          other.total_deaths == this.total_deaths &&
          other.new_deaths == this.new_deaths &&
          other.total_recovered == this.total_recovered &&
          other.active_cases == this.active_cases &&
          other.serious_cases == this.serious_cases &&
          other.cases_per_million == this.cases_per_million &&
          other.deaths_per_million == this.deaths_per_million);
}

class WorldometersLocalsCompanion extends UpdateCompanion<WorldometersLocal> {
  final Value<int> worldometers_id;
  final Value<String> measurement_date;
  final Value<String> country;
  final Value<int> total_cases;
  final Value<int> new_cases;
  final Value<int> total_deaths;
  final Value<int> new_deaths;
  final Value<int> total_recovered;
  final Value<int> active_cases;
  final Value<int> serious_cases;
  final Value<double> cases_per_million;
  final Value<double> deaths_per_million;
  const WorldometersLocalsCompanion({
    this.worldometers_id = const Value.absent(),
    this.measurement_date = const Value.absent(),
    this.country = const Value.absent(),
    this.total_cases = const Value.absent(),
    this.new_cases = const Value.absent(),
    this.total_deaths = const Value.absent(),
    this.new_deaths = const Value.absent(),
    this.total_recovered = const Value.absent(),
    this.active_cases = const Value.absent(),
    this.serious_cases = const Value.absent(),
    this.cases_per_million = const Value.absent(),
    this.deaths_per_million = const Value.absent(),
  });
  WorldometersLocalsCompanion.insert({
    @required int worldometers_id,
    @required String measurement_date,
    @required String country,
    @required int total_cases,
    @required int new_cases,
    @required int total_deaths,
    @required int new_deaths,
    @required int total_recovered,
    @required int active_cases,
    @required int serious_cases,
    @required double cases_per_million,
    @required double deaths_per_million,
  })  : worldometers_id = Value(worldometers_id),
        measurement_date = Value(measurement_date),
        country = Value(country),
        total_cases = Value(total_cases),
        new_cases = Value(new_cases),
        total_deaths = Value(total_deaths),
        new_deaths = Value(new_deaths),
        total_recovered = Value(total_recovered),
        active_cases = Value(active_cases),
        serious_cases = Value(serious_cases),
        cases_per_million = Value(cases_per_million),
        deaths_per_million = Value(deaths_per_million);
  WorldometersLocalsCompanion copyWith(
      {Value<int> worldometers_id,
      Value<String> measurement_date,
      Value<String> country,
      Value<int> total_cases,
      Value<int> new_cases,
      Value<int> total_deaths,
      Value<int> new_deaths,
      Value<int> total_recovered,
      Value<int> active_cases,
      Value<int> serious_cases,
      Value<double> cases_per_million,
      Value<double> deaths_per_million}) {
    return WorldometersLocalsCompanion(
      worldometers_id: worldometers_id ?? this.worldometers_id,
      measurement_date: measurement_date ?? this.measurement_date,
      country: country ?? this.country,
      total_cases: total_cases ?? this.total_cases,
      new_cases: new_cases ?? this.new_cases,
      total_deaths: total_deaths ?? this.total_deaths,
      new_deaths: new_deaths ?? this.new_deaths,
      total_recovered: total_recovered ?? this.total_recovered,
      active_cases: active_cases ?? this.active_cases,
      serious_cases: serious_cases ?? this.serious_cases,
      cases_per_million: cases_per_million ?? this.cases_per_million,
      deaths_per_million: deaths_per_million ?? this.deaths_per_million,
    );
  }
}

class $WorldometersLocalsTable extends WorldometersLocals
    with TableInfo<$WorldometersLocalsTable, WorldometersLocal> {
  final GeneratedDatabase _db;
  final String _alias;
  $WorldometersLocalsTable(this._db, [this._alias]);
  final VerificationMeta _worldometers_idMeta =
      const VerificationMeta('worldometers_id');
  GeneratedIntColumn _worldometers_id;
  @override
  GeneratedIntColumn get worldometers_id =>
      _worldometers_id ??= _constructWorldometersId();
  GeneratedIntColumn _constructWorldometersId() {
    return GeneratedIntColumn(
      'worldometers_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _measurement_dateMeta =
      const VerificationMeta('measurement_date');
  GeneratedTextColumn _measurement_date;
  @override
  GeneratedTextColumn get measurement_date =>
      _measurement_date ??= _constructMeasurementDate();
  GeneratedTextColumn _constructMeasurementDate() {
    return GeneratedTextColumn(
      'measurement_date',
      $tableName,
      false,
    );
  }

  final VerificationMeta _countryMeta = const VerificationMeta('country');
  GeneratedTextColumn _country;
  @override
  GeneratedTextColumn get country => _country ??= _constructCountry();
  GeneratedTextColumn _constructCountry() {
    return GeneratedTextColumn(
      'country',
      $tableName,
      false,
    );
  }

  final VerificationMeta _total_casesMeta =
      const VerificationMeta('total_cases');
  GeneratedIntColumn _total_cases;
  @override
  GeneratedIntColumn get total_cases => _total_cases ??= _constructTotalCases();
  GeneratedIntColumn _constructTotalCases() {
    return GeneratedIntColumn(
      'total_cases',
      $tableName,
      false,
    );
  }

  final VerificationMeta _new_casesMeta = const VerificationMeta('new_cases');
  GeneratedIntColumn _new_cases;
  @override
  GeneratedIntColumn get new_cases => _new_cases ??= _constructNewCases();
  GeneratedIntColumn _constructNewCases() {
    return GeneratedIntColumn(
      'new_cases',
      $tableName,
      false,
    );
  }

  final VerificationMeta _total_deathsMeta =
      const VerificationMeta('total_deaths');
  GeneratedIntColumn _total_deaths;
  @override
  GeneratedIntColumn get total_deaths =>
      _total_deaths ??= _constructTotalDeaths();
  GeneratedIntColumn _constructTotalDeaths() {
    return GeneratedIntColumn(
      'total_deaths',
      $tableName,
      false,
    );
  }

  final VerificationMeta _new_deathsMeta = const VerificationMeta('new_deaths');
  GeneratedIntColumn _new_deaths;
  @override
  GeneratedIntColumn get new_deaths => _new_deaths ??= _constructNewDeaths();
  GeneratedIntColumn _constructNewDeaths() {
    return GeneratedIntColumn(
      'new_deaths',
      $tableName,
      false,
    );
  }

  final VerificationMeta _total_recoveredMeta =
      const VerificationMeta('total_recovered');
  GeneratedIntColumn _total_recovered;
  @override
  GeneratedIntColumn get total_recovered =>
      _total_recovered ??= _constructTotalRecovered();
  GeneratedIntColumn _constructTotalRecovered() {
    return GeneratedIntColumn(
      'total_recovered',
      $tableName,
      false,
    );
  }

  final VerificationMeta _active_casesMeta =
      const VerificationMeta('active_cases');
  GeneratedIntColumn _active_cases;
  @override
  GeneratedIntColumn get active_cases =>
      _active_cases ??= _constructActiveCases();
  GeneratedIntColumn _constructActiveCases() {
    return GeneratedIntColumn(
      'active_cases',
      $tableName,
      false,
    );
  }

  final VerificationMeta _serious_casesMeta =
      const VerificationMeta('serious_cases');
  GeneratedIntColumn _serious_cases;
  @override
  GeneratedIntColumn get serious_cases =>
      _serious_cases ??= _constructSeriousCases();
  GeneratedIntColumn _constructSeriousCases() {
    return GeneratedIntColumn(
      'serious_cases',
      $tableName,
      false,
    );
  }

  final VerificationMeta _cases_per_millionMeta =
      const VerificationMeta('cases_per_million');
  GeneratedRealColumn _cases_per_million;
  @override
  GeneratedRealColumn get cases_per_million =>
      _cases_per_million ??= _constructCasesPerMillion();
  GeneratedRealColumn _constructCasesPerMillion() {
    return GeneratedRealColumn(
      'cases_per_million',
      $tableName,
      false,
    );
  }

  final VerificationMeta _deaths_per_millionMeta =
      const VerificationMeta('deaths_per_million');
  GeneratedRealColumn _deaths_per_million;
  @override
  GeneratedRealColumn get deaths_per_million =>
      _deaths_per_million ??= _constructDeathsPerMillion();
  GeneratedRealColumn _constructDeathsPerMillion() {
    return GeneratedRealColumn(
      'deaths_per_million',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        worldometers_id,
        measurement_date,
        country,
        total_cases,
        new_cases,
        total_deaths,
        new_deaths,
        total_recovered,
        active_cases,
        serious_cases,
        cases_per_million,
        deaths_per_million
      ];
  @override
  $WorldometersLocalsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'worldometers_locals';
  @override
  final String actualTableName = 'worldometers_locals';
  @override
  VerificationContext validateIntegrity(WorldometersLocalsCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.worldometers_id.present) {
      context.handle(
          _worldometers_idMeta,
          worldometers_id.isAcceptableValue(
              d.worldometers_id.value, _worldometers_idMeta));
    } else if (isInserting) {
      context.missing(_worldometers_idMeta);
    }
    if (d.measurement_date.present) {
      context.handle(
          _measurement_dateMeta,
          measurement_date.isAcceptableValue(
              d.measurement_date.value, _measurement_dateMeta));
    } else if (isInserting) {
      context.missing(_measurement_dateMeta);
    }
    if (d.country.present) {
      context.handle(_countryMeta,
          country.isAcceptableValue(d.country.value, _countryMeta));
    } else if (isInserting) {
      context.missing(_countryMeta);
    }
    if (d.total_cases.present) {
      context.handle(_total_casesMeta,
          total_cases.isAcceptableValue(d.total_cases.value, _total_casesMeta));
    } else if (isInserting) {
      context.missing(_total_casesMeta);
    }
    if (d.new_cases.present) {
      context.handle(_new_casesMeta,
          new_cases.isAcceptableValue(d.new_cases.value, _new_casesMeta));
    } else if (isInserting) {
      context.missing(_new_casesMeta);
    }
    if (d.total_deaths.present) {
      context.handle(
          _total_deathsMeta,
          total_deaths.isAcceptableValue(
              d.total_deaths.value, _total_deathsMeta));
    } else if (isInserting) {
      context.missing(_total_deathsMeta);
    }
    if (d.new_deaths.present) {
      context.handle(_new_deathsMeta,
          new_deaths.isAcceptableValue(d.new_deaths.value, _new_deathsMeta));
    } else if (isInserting) {
      context.missing(_new_deathsMeta);
    }
    if (d.total_recovered.present) {
      context.handle(
          _total_recoveredMeta,
          total_recovered.isAcceptableValue(
              d.total_recovered.value, _total_recoveredMeta));
    } else if (isInserting) {
      context.missing(_total_recoveredMeta);
    }
    if (d.active_cases.present) {
      context.handle(
          _active_casesMeta,
          active_cases.isAcceptableValue(
              d.active_cases.value, _active_casesMeta));
    } else if (isInserting) {
      context.missing(_active_casesMeta);
    }
    if (d.serious_cases.present) {
      context.handle(
          _serious_casesMeta,
          serious_cases.isAcceptableValue(
              d.serious_cases.value, _serious_casesMeta));
    } else if (isInserting) {
      context.missing(_serious_casesMeta);
    }
    if (d.cases_per_million.present) {
      context.handle(
          _cases_per_millionMeta,
          cases_per_million.isAcceptableValue(
              d.cases_per_million.value, _cases_per_millionMeta));
    } else if (isInserting) {
      context.missing(_cases_per_millionMeta);
    }
    if (d.deaths_per_million.present) {
      context.handle(
          _deaths_per_millionMeta,
          deaths_per_million.isAcceptableValue(
              d.deaths_per_million.value, _deaths_per_millionMeta));
    } else if (isInserting) {
      context.missing(_deaths_per_millionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {worldometers_id};
  @override
  WorldometersLocal map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return WorldometersLocal.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(WorldometersLocalsCompanion d) {
    final map = <String, Variable>{};
    if (d.worldometers_id.present) {
      map['worldometers_id'] = Variable<int, IntType>(d.worldometers_id.value);
    }
    if (d.measurement_date.present) {
      map['measurement_date'] =
          Variable<String, StringType>(d.measurement_date.value);
    }
    if (d.country.present) {
      map['country'] = Variable<String, StringType>(d.country.value);
    }
    if (d.total_cases.present) {
      map['total_cases'] = Variable<int, IntType>(d.total_cases.value);
    }
    if (d.new_cases.present) {
      map['new_cases'] = Variable<int, IntType>(d.new_cases.value);
    }
    if (d.total_deaths.present) {
      map['total_deaths'] = Variable<int, IntType>(d.total_deaths.value);
    }
    if (d.new_deaths.present) {
      map['new_deaths'] = Variable<int, IntType>(d.new_deaths.value);
    }
    if (d.total_recovered.present) {
      map['total_recovered'] = Variable<int, IntType>(d.total_recovered.value);
    }
    if (d.active_cases.present) {
      map['active_cases'] = Variable<int, IntType>(d.active_cases.value);
    }
    if (d.serious_cases.present) {
      map['serious_cases'] = Variable<int, IntType>(d.serious_cases.value);
    }
    if (d.cases_per_million.present) {
      map['cases_per_million'] =
          Variable<double, RealType>(d.cases_per_million.value);
    }
    if (d.deaths_per_million.present) {
      map['deaths_per_million'] =
          Variable<double, RealType>(d.deaths_per_million.value);
    }
    return map;
  }

  @override
  $WorldometersLocalsTable createAlias(String alias) {
    return $WorldometersLocalsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $WorldometersLocalsTable _worldometersLocals;
  $WorldometersLocalsTable get worldometersLocals =>
      _worldometersLocals ??= $WorldometersLocalsTable(this);
  WorldometersLocalDao _worldometersLocalDao;
  WorldometersLocalDao get worldometersLocalDao =>
      _worldometersLocalDao ??= WorldometersLocalDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [worldometersLocals];
}