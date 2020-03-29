import 'package:covidinfo/model/article_model.dart';
import 'package:covidinfo/res/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCard extends StatefulWidget {
  final Article article;
  NewsCard(this.article);

  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  void initState() {
    super.initState();
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        child: Stack(
          children: <Widget>[
            Container(
              child: FadeInImage.assetNetwork(
                image: widget.article.urlToImage,
                fit: BoxFit.fitWidth,
                placeholder: "assets/img/news.png",
              ),
            ),
            Positioned(
              bottom: 18,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColors.black.withOpacity(0.45),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        widget.article.title,
                        maxLines: 3,
                        softWrap: true,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColors.black.withOpacity(0.45),
                ),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 4, bottom: 2),
                    child: Text(
                      '- ${widget.article.source?.name ?? 'unknown'}',
                      style: TextStyle(color: AppColors.white, fontSize: 14.0, fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        onTap: () => _launchURL(widget.article.url),
      ),
    );
  }
}
