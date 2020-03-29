import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:covidinfo/model/worldometer_model.dart';
import 'package:covidinfo/service/worldometer_service.dart';
import 'package:covidinfo/util/connectivity_helper.dart';
import 'package:covidinfo/util/view_state.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends BlocBase {
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
        }
      }).catchError((error) {
        _viewStateController.add(ViewState.loadingError);
      });
    } else {
      _viewStateController.add(ViewState.loadingError);
    }
  }

  @override
  void dispose() {
    _viewStateController.close();
    _worldometerDataController.close();
    super.dispose();
  }
}
