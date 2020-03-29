import 'dart:async';

import 'package:covidinfo/bloc/detail_bloc.dart';
import 'package:covidinfo/model/worldometer_model.dart';
import 'package:covidinfo/res/app_colors.dart';
import 'package:covidinfo/res/app_textstyles.dart';
import 'package:covidinfo/routes/routes.dart';
import 'package:covidinfo/util/localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DetailPage extends StatefulWidget {
  final Worldometer countryData;

  const DetailPage({Key key, this.countryData}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  DetailBloc _bloc = DetailBloc();
  Completer<GoogleMapController> _controller = Completer();
  double _zoomVal = 4.0;
  LatLng _currentLocation = LatLng(0, 0);
  Set<Marker> _markers = Set();

  @override
  void initState() {
    _bloc.coordinates.listen((coords) {
      _gotoLocation(coords);
      _setmarker(coords);
    });

    _bloc.getCountryInfo(widget.countryData.country);

    super.initState();
  }

  Future<void> _gotoLocation(Coordinates coordinates) async {
    _currentLocation = LatLng(coordinates.latitude, coordinates.longitude);
    _zoomVal = 4.0;
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: _currentLocation, zoom: _zoomVal)));
  }

  void _setmarker(Coordinates coordinates) {
    _markers.clear();

    _markers.add(
      Marker(
        markerId: MarkerId("1"),
        position: LatLng(coordinates.latitude, coordinates.longitude),
      ),
    );

    setState(() {});
  }

  Widget _buildGoogleMap() {
    return Container(
      child: Center(
        child: ClipRRect(
          child: Align(
            alignment: Alignment.bottomRight,
            heightFactor: 1,
            widthFactor: 1,
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(target: _currentLocation, zoom: _zoomVal),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              markers: _markers,
            ),
          ),
        ),
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
      body: SlidingUpPanel(
        panel: Center(
          child: Container(
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                children: <Widget>[
                  Text(
                    widget.countryData.country,
                    style: AppTextStyles.bigTextPrimary,
                  ),
                  Text(
                    widget.countryData.measurementDate,
                    style: AppTextStyles.descriptionRegularBlack,
                  ),
                  SingleChildScrollView(
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.all(25.0),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    AppLocalizations.of(context).translate('total'),
                                    style: AppTextStyles.detailTextGray,
                                  ),
                                  Text(
                                    "${widget.countryData.totalCases}",
                                    style: AppTextStyles.detailTextGray,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    AppLocalizations.of(context).translate('deaths'),
                                    style: AppTextStyles.detailTextGray,
                                  ),
                                  Text(
                                    "${widget.countryData.totalDeaths}",
                                    style: AppTextStyles.detailTextGray,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    AppLocalizations.of(context).translate('recovered'),
                                    style: AppTextStyles.detailTextGray,
                                  ),
                                  Text(
                                    "${widget.countryData.totalRecovered}",
                                    style: AppTextStyles.detailTextGray,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    AppLocalizations.of(context).translate('newCases'),
                                    style: AppTextStyles.detailTextGray,
                                  ),
                                  Text(
                                    "${widget.countryData.newCases}",
                                    style: AppTextStyles.detailTextGray,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    AppLocalizations.of(context).translate('newDeaths'),
                                    style: AppTextStyles.detailTextGray,
                                  ),
                                  Text(
                                    "${widget.countryData.newDeaths}",
                                    style: AppTextStyles.detailTextGray,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    AppLocalizations.of(context).translate('activeCases'),
                                    style: AppTextStyles.detailTextGray,
                                  ),
                                  Text(
                                    "${widget.countryData.activeCases}",
                                    style: AppTextStyles.detailTextGray,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    AppLocalizations.of(context).translate('seriousCases'),
                                    style: AppTextStyles.detailTextGray,
                                  ),
                                  Text(
                                    "${widget.countryData.seriousCases}",
                                    style: AppTextStyles.detailTextGray,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    AppLocalizations.of(context).translate('casesPerMillion'),
                                    style: AppTextStyles.detailTextGray,
                                  ),
                                  Text(
                                    "${widget.countryData.casesPerMillion}",
                                    style: AppTextStyles.detailTextGray,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    AppLocalizations.of(context).translate('deathsPerMillion'),
                                    style: AppTextStyles.detailTextGray,
                                  ),
                                  Text(
                                    "${widget.countryData.deathsPerMillion}",
                                    style: AppTextStyles.detailTextGray,
                                  ),
                                ],
                              ),
                            ),
                            RaisedButton.icon(
                              onPressed: () {
                                Routes.push(context, Routes.chart, data: widget.countryData);
                              },
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                              label: Text(
                                AppLocalizations.of(context).translate('chartButton'),
                                style: TextStyle(color: Colors.white),
                              ),
                              icon: Icon(
                                Icons.insert_chart,
                                color: Colors.white,
                              ),
                              textColor: AppColors.white,
                              splashColor: Colors.red,
                              color: AppColors.primary,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: _buildGoogleMap(),
        backdropEnabled: true,
        parallaxEnabled: true,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(18.0), topRight: Radius.circular(18.0)),
      ),
    );
  }
}
