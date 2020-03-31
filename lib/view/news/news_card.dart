import 'package:covidinfo/model/article_model.dart';
import 'package:covidinfo/res/app_colors.dart';
import 'package:covidinfo/res/app_dimens.dart';
import 'package:covidinfo/util/launch_url_helper.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
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
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () => LaunchUrlHelper.launchURL(widget.article.url),
            child: Stack(
              children: <Widget>[
                widget.article.urlToImage != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(AppDimens.cardRadius),
                          topRight: Radius.circular(AppDimens.cardRadius),
                        ),
                        child: FadeInImage.assetNetwork(
                          image: widget.article.urlToImage,
                          fit: BoxFit.fitWidth,
                          placeholder: "assets/img/news_cover.png",
                        ),
                      )
                    : Image.asset(
                        "assets/img/news_cover.png",
                        fit: BoxFit.fitWidth,
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
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.article.title,
              maxLines: 3,
              softWrap: true,
              style: TextStyle(
                color: AppColors.gray,
                fontSize: 18.0,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
