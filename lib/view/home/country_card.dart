import 'package:covidinfo/model/worldometer_model.dart';
import 'package:covidinfo/res/app_colors.dart';
import 'package:covidinfo/res/app_dimens.dart';
import 'package:covidinfo/res/app_textstyles.dart';
import 'package:covidinfo/routes/routes.dart';
import 'package:covidinfo/util/localizations.dart';
import 'package:flutter/material.dart';

class CountryCard extends StatefulWidget {
  final Worldometer countryData;
  CountryCard(this.countryData);

  @override
  _CountryCardState createState() => _CountryCardState();
}

class _CountryCardState extends State<CountryCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(4),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(AppDimens.cardRadius),
                  topLeft: Radius.circular(AppDimens.cardRadius),
                  bottomRight: Radius.circular(AppDimens.cardRadius),
                  topRight: Radius.circular(AppDimens.cardRadius),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(-5.0, 5.0),
                    color: AppColors.gray.withOpacity(.3),
                    blurRadius: 10.0,
                  )
                ],
              ),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          widget.countryData.country,
                          style: AppTextStyles.titleBoldPrimary,
                        ),
                        Text(
                          widget.countryData.measurementDate,
                          style: AppTextStyles.descriptionRegularBlack,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "${AppLocalizations.of(context).translate('total')}: ${widget.countryData.totalCases}",
                          style: AppTextStyles.descriptionRegularBlack,
                        ),
                        Text(
                          "${AppLocalizations.of(context).translate('deaths')}: ${widget.countryData.totalDeaths}",
                          style: AppTextStyles.descriptionRegularBlack,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "${AppLocalizations.of(context).translate('recovered')}: ${widget.countryData.totalRecovered}",
                          style: AppTextStyles.descriptionRegularBlack,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        onTap: () {
          Routes.push(context, Routes.detail, data: widget.countryData);
        },
      ),
    );
  }
}
