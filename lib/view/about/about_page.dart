import 'package:covidinfo/res/app_colors.dart';
import 'package:covidinfo/res/app_textstyles.dart';
import 'package:covidinfo/util/launch_url_helper.dart';
import 'package:covidinfo/util/localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(AppLocalizations.of(context).translate('about')),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    "assets/img/coronavirus_9.png",
                    fit: BoxFit.fill,
                    width: 64,
                    height: 64,
                  ),
                ),
                Text(
                  AppLocalizations.of(context).translate("app_title"),
                  style: AppTextStyles.bigTextPrimary,
                )
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 16.0,
                    child: Text(
                      AppLocalizations.of(context).translate("about_line1"),
                      style: AppTextStyles.titleBoldGray,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 16.0,
                    child: Text(
                      AppLocalizations.of(context).translate("about_line2"),
                      style: AppTextStyles.titleBoldGray,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 16.0,
                    child: Text(
                      AppLocalizations.of(context).translate("about_numbers"),
                      style: AppTextStyles.titleBoldGray,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 16.0,
                    child: GestureDetector(
                      child: Text(
                        "https://www.worldometers.info/coronavirus/",
                        style: AppTextStyles.link,
                      ),
                      onTap: () => LaunchUrlHelper.launchURL("https://www.worldometers.info/coronavirus/"),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 16.0,
                    child: Text(
                      AppLocalizations.of(context).translate("about_news"),
                      style: AppTextStyles.titleBoldGray,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width - 16.0,
                    child: GestureDetector(
                      child: Text(
                        "https://newsapi.org/",
                        style: AppTextStyles.link,
                      ),
                      onTap: () => LaunchUrlHelper.launchURL("https://newsapi.org/"),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
