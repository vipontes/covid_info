import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:covidinfo/enums/view_state.dart';
import 'package:covidinfo/model/worldometer_model.dart';
import 'package:covidinfo/service/worldometer_service.dart';
import 'package:covidinfo/util/connectivity_helper.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends BlocBase {
  List<Worldometer> _countries = List<Worldometer>();
  List<Worldometer> _countriesForDisplay = List<Worldometer>();

  final _viewStateController = BehaviorSubject<ViewState>();
  Stream<ViewState> get viewState => _viewStateController.stream;

  final _worldometerDataController = BehaviorSubject<List<Worldometer>>();
  Stream<List<Worldometer>> get countriesData => _worldometerDataController.stream;

  final _worldometerFullDataController = BehaviorSubject<List<Worldometer>>();
  Stream<List<Worldometer>> get countriesFullData => _worldometerFullDataController.stream;

  void getInfo(String selectedDate) async {
    var connectivity = await ConnectivityHelper.checkConnectivity();
    if (connectivity) {
      WorldometerService().getInfo(selectedDate, false).then((res) {
        var decodedResponse = res.fold((error) => error, (val) => val);
        if (decodedResponse is List<Worldometer>) {
          _worldometerDataController.sink.add(decodedResponse);
          _worldometerFullDataController.sink.add(decodedResponse);
          _refreshCountries(decodedResponse);
          _viewStateController.add(ViewState.loaded);
          _viewStateController.add(ViewState.idle);
        }
      }).catchError((error) {
        _viewStateController.add(ViewState.loadingError);
      });
    } else {
      _viewStateController.add(ViewState.loadingError);
    }
  }

  void refreshLocalData(String selectedDate) async {
    var connectivity = await ConnectivityHelper.checkConnectivity();
    if (connectivity) {
      WorldometerService().getInfo(selectedDate, true).then((res) {
        var decodedResponse = res.fold((error) => error, (val) => val);
        if (decodedResponse is List<Worldometer>) {
          _worldometerDataController.sink.add(decodedResponse);
          _worldometerFullDataController.sink.add(decodedResponse);
          _refreshCountries(decodedResponse);
          _viewStateController.add(ViewState.loaded);
          _viewStateController.add(ViewState.idle);
        }
      }).catchError((error) {
        _viewStateController.add(ViewState.loadingError);
      });
    } else {
      _viewStateController.add(ViewState.loadingError);
    }
  }

  void _refreshCountries(List<Worldometer> list) {
    _countries.clear();
    _countriesForDisplay.clear();
    _countries.addAll(list);
    _countriesForDisplay.addAll(list);
  }

  void onSearchChange(String value) {
    _countriesForDisplay = _countries.where((item) {
      var name = item.country.toLowerCase();
      return name.contains(value);
    }).toList();

    _worldometerDataController.sink.add(_countriesForDisplay);
  }

  @override
  void dispose() {
    _viewStateController.close();
    _worldometerDataController.close();
    _worldometerFullDataController.close();
    super.dispose();
  }
}
