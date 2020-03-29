import 'package:covidinfo/bloc/news_bloc.dart';
import 'package:covidinfo/model/article_model.dart';
import 'package:covidinfo/model/worldometer_model.dart';
import 'package:covidinfo/res/app_colors.dart';
import 'package:covidinfo/res/app_textstyles.dart';
import 'package:covidinfo/util/localizations.dart';
import 'package:covidinfo/util/view_state.dart';
import 'package:covidinfo/view/news/news_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  final Worldometer countryData;

  const NewsPage({Key key, this.countryData}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  NewsBloc _bloc;

  @override
  void initState() {
    _bloc = NewsBloc();
    super.initState();
  }

  Future<Null> _refreshNews() {
    return Future.delayed(Duration(milliseconds: 600), () async {
      _bloc.refresh();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(AppLocalizations.of(context).translate('news')),
      ),
      body: SafeArea(
        child: StreamBuilder<ViewState>(
          stream: _bloc.viewState,
          initialData: ViewState.loading,
          builder: (context, snapshot) {
            if (snapshot.data == ViewState.loading) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                  ),
                ),
              );
            } else if (snapshot.data == ViewState.loadingError) {
              return GestureDetector(
                onTap: () => _refreshNews(),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "assets/img/coronavirus_1.png",
                        fit: BoxFit.fill,
                        width: 200,
                        height: 200,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Text(
                          AppLocalizations.of(context).translate("internet_connection_error"),
                          style: AppTextStyles.titleBoldGray,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return StreamBuilder<List<Article>>(
                stream: _bloc.articles,
                builder: (context, snapshot) {
                  var data = snapshot.data;
                  if (data == null) {
                    return GestureDetector(
                      onTap: () => _refreshNews(),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              "assets/img/coronavirus_8.png",
                              fit: BoxFit.fill,
                              width: 200,
                              height: 200,
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    if (data.length == 0) {
                      return GestureDetector(
                        onTap: () => _refreshNews(),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                "assets/img/coronavirus_2.png",
                                fit: BoxFit.fill,
                                width: 200,
                                height: 200,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Text(
                                  AppLocalizations.of(context).translate("no_data"),
                                  style: AppTextStyles.titleBoldGray,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return RefreshIndicator(
                        child: ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (BuildContext context, int index) => NewsCard(data[index]),
                        ),
                        onRefresh: _refreshNews,
                      );
                    }
                  }
                },
              );
            }
          },
        ),
      ),
    );
  }
}
