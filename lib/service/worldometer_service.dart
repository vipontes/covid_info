import 'dart:convert';

import 'package:covidinfo/database/moor_database.dart';
import 'package:covidinfo/interfaces/i_worldometer_service.dart';
import 'package:covidinfo/main.dart';
import 'package:covidinfo/model/worldometer_model.dart';
import 'package:covidinfo/service/error_handler/error_handler.dart';
import 'package:covidinfo/service/interceptor/app_interceptors.dart';
import 'package:covidinfo/util/constants.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';

class WorldometerService implements IWorldometerService {
  Dio dio = new Dio(
    new BaseOptions(
      baseUrl: Constants.baseUrl,
      connectTimeout: Constants.connectTimeout,
      receiveTimeout: Constants.receiveTimeout,
      validateStatus: (status) {
        return status <= 500;
      },
    ),
  );

  Dio addInterceptors(Dio dio) {
    dio.interceptors.add(AppInterceptors());
  }

  // ignore: slash_for_doc_comments
  /**
   * @brief Implementação do Singleton
   */
  static final WorldometerService _singleton = new WorldometerService._internal();

  factory WorldometerService() {
    return _singleton;
  }

  WorldometerService._internal() {
    addInterceptors(dio);
  }

  @override
  Future<Either<ErrorHandler, List<Worldometer>>> getInfo(String selectedDate, bool refreshLocalData) async {
    final database = Provider.of<AppDatabase>(navigatorKey.currentContext);

    List<WorldometersLocal> localData = List<WorldometersLocal>();

    if (refreshLocalData) {
      await database.worldometersLocalDao.cleanSelectedDate(selectedDate);
    } else {
      localData = await database.worldometersLocalDao.getDataByDate(selectedDate);
    }

    if (localData.length == 0) {
      try {
        Response response = await dio.post("/worldometers", data: {"selectedDate": selectedDate});

        if (response.statusCode == 200) {
          List<Worldometer> data = Worldometer.listFromJson(response.data);

          data.forEach((item) async {
            WorldometersLocal itemData = WorldometersLocal(
                worldometers_id: item.worldometersId,
                measurement_date: item.measurementDate,
                country: item.country,
                total_cases: item.totalCases,
                new_cases: item.newCases,
                total_deaths: item.totalDeaths,
                new_deaths: item.newDeaths,
                total_recovered: item.totalRecovered,
                active_cases: item.activeCases,
                serious_cases: item.seriousCases,
                cases_per_million: item.casesPerMillion,
                deaths_per_million: item.deathsPerMillion);

            await database.worldometersLocalDao.insertItem(itemData);
          });

          return Right(data);
        } else {
          final Map<String, dynamic> decodedMessage = json.decode(response.toString());

          return Left(ErrorHandler(response.statusCode, decodedMessage['msg']));
        }
      } on DioError catch (error) {
        return Left(ErrorHandler(500, error.message));
      }
    } else {
      List<Worldometer> data = List<Worldometer>();
      localData.forEach((item) {
        Worldometer element = Worldometer(
            worldometersId: item.worldometers_id,
            measurementDate: item.measurement_date,
            country: item.country,
            totalCases: item.total_cases,
            newCases: item.new_cases,
            totalDeaths: item.total_deaths,
            newDeaths: item.new_deaths,
            totalRecovered: item.total_recovered,
            activeCases: item.active_cases,
            seriousCases: item.serious_cases,
            casesPerMillion: item.cases_per_million,
            deathsPerMillion: item.deaths_per_million);

        data.add(element);
      });

      return Right(data);
    }
  }
}
