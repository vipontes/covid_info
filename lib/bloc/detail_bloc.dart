import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:covidinfo/service/geocoder_service.dart';
import 'package:covidinfo/util/view_state.dart';
import 'package:geocoder/geocoder.dart';
import 'package:rxdart/rxdart.dart';

class DetailBloc extends BlocBase {
  final _viewStateController = BehaviorSubject<ViewState>();
  Stream<ViewState> get viewState => _viewStateController.stream;

  final _coordinatesController = BehaviorSubject<Coordinates>();
  Stream<Coordinates> get coordinates => _coordinatesController.stream;
  Function(Coordinates) get onCoordinatesChanged => _coordinatesController.add;

  Future getCountryInfo(String countryName) async {
    GeocoderService().getCountryCoordinates(countryName).then((res) {
      var decodedResponse = res.fold((error) => error, (val) => val);
      if (decodedResponse is Coordinates) {
        _coordinatesController.sink.add(decodedResponse);
      }
    });
  }

  @override
  void dispose() {
    _coordinatesController.close();
    _viewStateController.close();
    super.dispose();
  }
}
