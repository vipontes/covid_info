import 'package:covidinfo/bloc/chart_bloc.dart';
import 'package:covidinfo/model/worldometer_model.dart';
import 'package:covidinfo/res/app_colors.dart';
import 'package:covidinfo/res/app_textstyles.dart';
import 'package:covidinfo/util/localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChartPage extends StatefulWidget {
  final Worldometer countryData;

  const ChartPage({Key key, this.countryData}) : super(key: key);

  @override
  _ChartPageState createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  ChartBloc _bloc = ChartBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(AppLocalizations.of(context).translate('app_title')),
      ),
      body: Center(
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
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                AppLocalizations.of(context).translate("under_construction"),
                style: AppTextStyles.titleBoldGray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
