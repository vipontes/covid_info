import 'package:covidinfo/model/worldometer_model.dart';
import 'package:covidinfo/res/app_colors.dart';
import 'package:covidinfo/res/app_textstyles.dart';
import 'package:flutter/material.dart';

class CountryCard extends StatefulWidget {
  final Worldometer item;
  CountryCard(this.item);

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
                  bottomLeft: Radius.circular(8.0),
                  topLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
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
                          widget.item.country,
                          style: AppTextStyles.titleBoldPrimary,
                        ),
                        Text(
                          widget.item.measurementDate,
                          style: AppTextStyles.descriptionRegularBlack,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "TOTAL: ${widget.item.totalCases}",
                          style: AppTextStyles.descriptionRegularBlack,
                        ),
                        Text(
                          "DEATHS: ${widget.item.totalDeaths}",
                          style: AppTextStyles.descriptionRegularBlack,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "RECOVERED: ${widget.item.totalRecovered}",
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
        onTap: () {},
      ),
    );
  }
}
