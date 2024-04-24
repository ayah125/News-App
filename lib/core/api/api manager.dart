import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/core/model/NewsResponse.dart';
import 'package:newsapp/core/model/SourcesResponse.dart';
class ApiManager{
  static const baseUrl='newsapi.org';
  static const apiKey="db11a52d7fc843af8ba0ef25cbcb5dae";
  static Future<SourcesResponse>getSources(String category) async{
    var url=Uri.https(baseUrl,"v2/top-headlines/sources",{
      "apiKey" : apiKey,
      "category":category
    });
var response=await http.get(url);
return SourcesResponse.fromJson(jsonDecode(response.body));
  }
  static Future<NewsResponse> getNews({String? sourceId,String? query})async {
var url=Uri.https(baseUrl,'v2/everything',{
  'apiKey':apiKey,
  'sources':sourceId,
  'q':query
});
var Response= await http.get(url);
return NewsResponse.fromJson(jsonDecode(Response.body));
  }
  // db11a52d7fc843af8ba0ef25cbcb5dae
// /v2/top-headlines/sources?apiKey=API_KEY
}