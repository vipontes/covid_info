import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:covidinfo/enums/chart_option.dart';
import 'package:covidinfo/enums/view_state.dart';
import 'package:covidinfo/model/cases_chart_model.dart';
import 'package:covidinfo/model/worldometer_model.dart';
import 'package:covidinfo/service/worldometer_service.dart';
import 'package:covidinfo/util/connectivity_helper.dart';
import 'package:rxdart/rxdart.dart';

class ChartBloc extends BlocBase {
  final String country;
  List<Worldometer> _countries = List<Worldometer>();

  final _viewStateController = BehaviorSubject<ViewState>();
  Stream<ViewState> get viewState => _viewStateController.stream;

  final _chartDataController = BehaviorSubject<List<charts.Series<CasesChart, DateTime>>>();
  Stream<List<charts.Series<CasesChart, DateTime>>> get chartData => _chartDataController.stream;

  final _worldometerDataController = BehaviorSubject<List<Worldometer>>();
  Stream<List<Worldometer>> get data => _worldometerDataController.stream;
  Function(List<Worldometer>) get onDataChanged => _worldometerDataController.add;

  ChartBloc(this.country) {
    _getCountryInfo(this.country);
  }

  void _getCountryInfo(String country) async {
    var connectivity = await ConnectivityHelper.checkConnectivity();
    if (connectivity) {
      WorldometerService().getCountryInfo(country).then((res) {
        var decodedResponse = res.fold((error) => error, (val) => val);
        if (decodedResponse is List<Worldometer>) {
          _worldometerDataController.sink.add(decodedResponse);
          _viewStateController.add(ViewState.loaded);
          _viewStateController.add(ViewState.idle);

          _countries.addAll(decodedResponse.reversed.toList());
        }
      }).catchError((error) {
        _viewStateController.add(ViewState.loadingError);
      });
    } else {
      _viewStateController.add(ViewState.loadingError);
    }
  }

  void getChartData(ChartOption option) {
    List<CasesChart> data = List<CasesChart>();
    //int i = 0;
    _countries.forEach((item) {
      var day = DateTime.parse(item.measurementDate);
      //day = i;

      switch (option) {
        case ChartOption.totalDeaths:
          var element = CasesChart(day, item.totalDeaths);
          data.add(element);
          break;
        case ChartOption.newCases:
          var element = CasesChart(day, item.newCases);
          data.add(element);
          break;
        case ChartOption.newDeaths:
          var element = CasesChart(day, item.newDeaths);
          data.add(element);
          break;
        case ChartOption.totalCases:
        default:
          var element = CasesChart(day, item.totalCases);
          data.add(element);
          break;
      }

      //i++;
    });

    List<charts.Series<CasesChart, DateTime>> listSeries = List<charts.Series<CasesChart, DateTime>>();
    listSeries.add(charts.Series<CasesChart, DateTime>(
      id: 'Cases',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      domainFn: (CasesChart cases, _) => cases.day,
      measureFn: (CasesChart cases, _) => cases.count,
      data: data,
    ));

    _chartDataController.sink.add(listSeries);
  }

  @override
  void dispose() {
    _viewStateController.close();
    _worldometerDataController.close();
    _chartDataController.close();
    super.dispose();
  }
}
