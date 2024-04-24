import 'package:flutter/material.dart';
import 'package:newsapp/core/api/api%20manager.dart';

import 'package:newsapp/news/news_item.dart';

import '../core/model/News.dart';
class SearchScreen extends StatefulWidget {
static const String routeName='search';
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}
class _SearchScreenState extends State<SearchScreen> {
String query="";
List<News> list=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar:  AppBar(
  toolbarHeight: 70,
elevation: 0,
  shape:  const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25)
      )
  ),
  leading: SizedBox(),
leadingWidth: 10,
title: Container(
  alignment: Alignment.center,
  height: 60,
  padding: EdgeInsets.all(8),
  margin: EdgeInsets.all(8),
  child: TextFormField(
    onChanged: (String?value){
setState(() {
  query=value!;
});
    },
  decoration: InputDecoration(
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(25),
    borderSide: BorderSide(
      color: Colors.white,
    )
  ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(
            color: Colors.white,
          )
      ),
      suffixIcon: IconButton(
        onPressed: (){},
        icon: Icon(Icons.search,color: Colors.green,),
      ),
      prefixIcon: IconButton(
        onPressed: (){
          Navigator.pop(context);
        },
        icon: Icon(Icons.close,color: Colors.green,),
      ),
      hintText: 'Search Article',
      hintStyle: TextStyle(
        color: Colors.green.shade300,
      ),
      contentPadding: EdgeInsets.only(top: 10),
      filled: true,
  fillColor: Colors.white
  ),


  ),

),
    ),
    body: ListView.builder(itemBuilder:(context,index)=>NewsItem(search().elementAt(index))
    ,itemCount: search().length,),
    );

  }

  List search()
{ApiManager.getNews(query: query).then((newsResponse) {
list=newsResponse.newsList ?? [];

}).catchError((error)  {
debugPrint("errorrr $error");
  });
  return list;
}
}
