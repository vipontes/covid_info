import 'package:covidinfo/model/worldometer_model.dart';
import 'package:covidinfo/res/app_colors.dart';
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
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(-5.0, 5.0),
                    color: AppColors.gray.withOpacity(.3),
                    blurRadius: 10.0,
                  )
                ],
              ),
              child: Center(
                child: Text(widget.item.country),
              ),
            ),
          ],
        ),
        onTap: () {},
      ),
    );
  }
}
