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
  Stream<List<Worldometer>> get data => _worldometerDataController.stream;
  Function(List<Worldometer>) get onDataChanged => _worldometerDataController.add;

  void getInfo(String selectedDate) async {
    var connectivity = await ConnectivityHelper.checkConnectivity();
    if (connectivity) {
      WorldometerService().getInfo(selectedDate, false).then((res) {
        var decodedResponse = res.fold((error) => error, (val) => val);
        if (decodedResponse is List<Worldometer>) {
          _worldometerDataController.sink.add(decodedResponse);
          _viewStateController.add(ViewState.loaded);
          _viewStateController.add(ViewState.idle);

          _countries.addAll(decodedResponse);
          _countriesForDisplay = _countries;
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
          _viewStateController.add(ViewState.loaded);
          _viewStateController.add(ViewState.idle);

          _countries.addAll(decodedResponse);
          _countriesForDisplay = _countries;
        }
      }).catchError((error) {
        _viewStateController.add(ViewState.loadingError);
      });
    } else {
      _viewStateController.add(ViewState.loadingError);
    }
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
    super.dispose();
  }
}
