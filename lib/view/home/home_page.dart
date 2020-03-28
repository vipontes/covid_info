import 'package:covidinfo/bloc/home_bloc.dart';
import 'package:covidinfo/model/worldometer_model.dart';
import 'package:covidinfo/res/app_colors.dart';
import 'package:covidinfo/util/date_helper.dart';
import 'package:covidinfo/util/localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'country_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc _bloc = HomeBloc();

  @override
  void initState() {
    var selectedDate = DateHelper.currentDateAsString();
    _bloc.getInfo(selectedDate);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(AppLocalizations.of(context).translate('app_title')),
      ),
      body: StreamBuilder<List<Worldometer>>(
        stream: _bloc.data,
        builder: (context, snapshot) {
          var data = snapshot.data;
          if (data == null) {
            return Container();
          } else {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) =>
                  CountryCard(data[index]),
            );
          }
        },
      ),
    );
  }
}
