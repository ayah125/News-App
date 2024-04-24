import 'package:flutter/material.dart';
import 'package:newsapp/core/api/api%20manager.dart';
import 'package:newsapp/core/model/NewsResponse.dart';
import 'package:newsapp/core/model/Sources.dart';
import 'package:newsapp/news/news_item.dart';
class NewsList extends StatelessWidget {
  Source source;
  NewsList(this.source);
  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: FutureBuilder<NewsResponse>(
          future:ApiManager.getNews(sourceId:  source.id??"") ,
          builder: (buildcontext,snapshot) {
            if(snapshot.connectionState==ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator(),);
            }
            if(snapshot.hasError) {
              return Center(child: Text("error${snapshot.error.toString()}"),);

            }
            if(snapshot.data?.status=='error') {
              return Center(child: Text("error from server ${snapshot.data?.message.toString()}"),);
            }
         var newsList=snapshot.data?.newsList;
            return ListView.builder(itemBuilder: (buildcontext,index) {
return NewsItem(newsList![index]);
            },itemCount: newsList?.length??0,);
          }),
    );
  }
}
