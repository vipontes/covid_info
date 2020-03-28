import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:covidinfo/model/worldometer_model.dart';
import 'package:covidinfo/service/worldometer_service.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends BlocBase {
  final _worldometerDataController = BehaviorSubject<List<Worldometer>>();
  Stream<List<Worldometer>> get data => _worldometerDataController.stream;
  Function(List<Worldometer>) get onDataChanged =>
      _worldometerDataController.add;

  void getInfo(String selectedDate) {
    WorldometerService().getInfo(selectedDate).then((res) {
      var decodedResponse = res.fold((error) => error, (val) => val);
      if (decodedResponse is List<Worldometer>) {
        _worldometerDataController.sink.add(decodedResponse);
      }
    });
  }

  @override
  void dispose() {
    _worldometerDataController.close();
    super.dispose();
  }
}
