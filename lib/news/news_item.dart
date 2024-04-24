import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newsapp/core/model/News.dart';
import 'package:newsapp/news/news%20details.dart';
class NewsItem extends StatelessWidget {
  News news;
  NewsItem(this.news);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, NewsDetails.routeName,arguments: news);
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              child: CachedNetworkImage(
               imageUrl:  news?.urlToImage ?? "",
                height: 200,
                width: double.infinity,
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),

              ),
              borderRadius: BorderRadius.circular(18),
            ),
            Text(news.title ?? "",
              textAlign: TextAlign.start,style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),),
            Text(news.publishedAt ?? "",  textAlign: TextAlign.end),
          ],
        ),
      ),
    );
  }
}
