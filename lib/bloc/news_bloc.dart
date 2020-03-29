import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:covidinfo/model/article_model.dart';
import 'package:covidinfo/model/news_model.dart';
import 'package:covidinfo/service/news_service.dart';
import 'package:covidinfo/util/connectivity_helper.dart';
import 'package:covidinfo/util/view_state.dart';
import 'package:rxdart/rxdart.dart';

class NewsBloc extends BlocBase {
  final _viewStateController = BehaviorSubject<ViewState>();
  Stream<ViewState> get viewState => _viewStateController.stream;

  final _articlesDataController = BehaviorSubject<List<Article>>();
  Stream<List<Article>> get articles => _articlesDataController.stream;

  NewsBloc() {
    refresh();
  }

  void refresh() async {
    var connectivity = await ConnectivityHelper.checkConnectivity();
    if (connectivity) {
      NewsService().getNews().then((res) {
        var decodedResponse = res.fold((error) => error, (val) => val);
        if (decodedResponse is News) {
          _articlesDataController.sink.add(decodedResponse.articles);
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
    _articlesDataController.close();
    super.dispose();
  }
}
