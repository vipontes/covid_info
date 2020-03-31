import 'package:charts_flutter/flutter.dart' as charts;
import 'package:covidinfo/bloc/chart_bloc.dart';
import 'package:covidinfo/enums/chart_option.dart';
import 'package:covidinfo/enums/view_state.dart';
import 'package:covidinfo/model/cases_chart_model.dart';
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
  ChartBloc _bloc;

  ChartOption _activeChartOption = ChartOption.totalCases;

  @override
  void initState() {
    _bloc = ChartBloc(widget.countryData.country);

    _bloc.viewState.listen((state) {
      switch (state) {
        case ViewState.loadingError:
          break;
        case ViewState.loading:
          break;
        case ViewState.loaded:
          _bloc.getChartData(_activeChartOption);
          break;
        case ViewState.idle:
          break;
        default:
          break;
      }
    });

    super.initState();
  }

  Widget _selectedButton(ChartOption option, String title, IconData iconData) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: RaisedButton.icon(
        onPressed: () {
          setState(() {
            _activeChartOption = option;
          });
          _bloc.getChartData(_activeChartOption);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
        label: Text(
          title,
          style: TextStyle(color: AppColors.white),
        ),
        icon: Icon(
          iconData,
          color: AppColors.white,
        ),
        textColor: AppColors.white,
        splashColor: Colors.red,
        color: AppColors.primary,
      ),
    );
  }

  Widget _unselectedButton(ChartOption option, String title, IconData iconData) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: OutlineButton.icon(
        onPressed: () {
          setState(() {
            _activeChartOption = option;
          });
          _bloc.getChartData(_activeChartOption);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
        label: Text(
          title,
          style: TextStyle(color: AppColors.primary),
        ),
        icon: Icon(
          iconData,
          color: AppColors.primary,
        ),
        textColor: AppColors.primary,
        splashColor: Colors.red,
        color: AppColors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(AppLocalizations.of(context).translate('app_title')),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text(
              widget.countryData.country,
              style: AppTextStyles.bigTextPrimary,
            ),
            Wrap(
              children: <Widget>[
                _activeChartOption == ChartOption.totalCases
                    ? _selectedButton(
                        ChartOption.totalCases, AppLocalizations.of(context).translate("total"), Icons.insert_chart)
                    : _unselectedButton(
                        ChartOption.totalCases, AppLocalizations.of(context).translate("total"), Icons.insert_chart),
                _activeChartOption == ChartOption.totalDeaths
                    ? _selectedButton(
                        ChartOption.totalDeaths, AppLocalizations.of(context).translate("deaths"), Icons.insert_chart)
                    : _unselectedButton(
                        ChartOption.totalDeaths, AppLocalizations.of(context).translate("deaths"), Icons.insert_chart),
                _activeChartOption == ChartOption.newCases
                    ? _selectedButton(
                        ChartOption.newCases, AppLocalizations.of(context).translate("newCases"), Icons.insert_chart)
                    : _unselectedButton(
                        ChartOption.newCases, AppLocalizations.of(context).translate("newCases"), Icons.insert_chart),
                _activeChartOption == ChartOption.newDeaths
                    ? _selectedButton(
                        ChartOption.newDeaths, AppLocalizations.of(context).translate("newDeaths"), Icons.insert_chart)
                    : _unselectedButton(
                        ChartOption.newDeaths, AppLocalizations.of(context).translate("newDeaths"), Icons.insert_chart),
              ],
            ),
            Expanded(
              child: StreamBuilder<List<charts.Series<CasesChart, DateTime>>>(
                  stream: _bloc.chartData,
                  builder: (context, snapshot) {
                    var data = snapshot.data;
                    if (data == null) {
                      return Container();
                    } else {
                      return charts.TimeSeriesChart(
                        data,
                        animate: true,
                        defaultRenderer: new charts.LineRendererConfig(includePoints: true),
                        domainAxis: new charts.EndPointsTimeAxisSpec(),
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
