import 'package:covidinfo/bloc/home_bloc.dart';
import 'package:covidinfo/model/worldometer_model.dart';
import 'package:covidinfo/res/app_colors.dart';
import 'package:covidinfo/res/app_textstyles.dart';
import 'package:covidinfo/util/date_helper.dart';
import 'package:covidinfo/util/localizations.dart';
import 'package:covidinfo/util/view_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'country_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc _bloc = HomeBloc();
  DateTime _date = DateTime.now();

  @override
  void initState() {
    var selectedDate = DateHelper.currentDateAsString();
    _bloc.getInfo(selectedDate);

    _bloc.viewState.listen((state) {
      switch (state) {
        case ViewState.loadingError:
          Fluttertoast.showToast(
              msg: AppLocalizations.of(context).translate('loading_error'),
              toastLength: Toast.LENGTH_SHORT,
              backgroundColor: AppColors.primary,
              textColor: AppColors.white);
          break;
        case ViewState.loading:
        case ViewState.loaded:
        case ViewState.idle:
        default:
          break;
      }
    });

    super.initState();
  }

  Future<Null> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );

    if (picked != null && picked != _date) {
      _date = picked;
      _bloc.getInfo(DateHelper.dateAsString(picked));
    }
  }

  Future<Null> _refreshLocalData() {
    return Future.delayed(Duration(milliseconds: 600), () async {
      _bloc.refreshLocalData(DateHelper.dateAsString(_date));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(AppLocalizations.of(context).translate('app_title')),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () => selectDate(context),
          ),
        ],
      ),
      body: StreamBuilder<ViewState>(
        stream: _bloc.viewState,
        initialData: ViewState.loading,
        builder: (context, snapshot) {
          if (snapshot.data == ViewState.loading) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(AppColors.primary),
                ),
              ),
            );
          } else if (snapshot.data == ViewState.loadingError) {
            return GestureDetector(
              onTap: () => _refreshLocalData(),
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
            return StreamBuilder<List<Worldometer>>(
              stream: _bloc.data,
              builder: (context, snapshot) {
                var data = snapshot.data;
                if (data == null) {
                  return GestureDetector(
                    onTap: () => _refreshLocalData(),
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
                      onTap: () => _refreshLocalData(),
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
                        itemBuilder: (BuildContext context, int index) => CountryCard(data[index]),
                      ),
                      onRefresh: _refreshLocalData,
                    );
                  }
                }
              },
            );
          }
        },
      ),
    );
  }
}
