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
  DateTime _date = DateTime.now();

  @override
  void initState() {
    var selectedDate = DateHelper.currentDateAsString();
    _bloc.getInfo(selectedDate);

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
      _bloc.getInfo(DateHelper.dateAsString(picked));
    }
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
