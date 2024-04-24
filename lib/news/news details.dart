import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/core/model/News.dart';
import 'package:url_launcher/url_launcher.dart';
class NewsDetails extends StatelessWidget {
static const String routeName='newsdetails';
  @override
  Widget build(BuildContext context) {
    News news=ModalRoute.of(context)!.settings?.arguments as News;
    return  Scaffold(
appBar: AppBar(
  elevation: 0,
  title:  const Text('News Details',style: TextStyle(
    color: Colors.white
  ),),
  centerTitle: true,
  iconTheme: const IconThemeData(color: Colors.white),
  shape:  const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28)
      )
  ),
),
      body: Column(
children: [
  ClipRRect(
    child: Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25)
      ),
      child:  Column(
  crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CachedNetworkImage(
          imageUrl: news.urlToImage??"",
            width: MediaQuery.of(context).size.width*0.92,
            height: 200,
            placeholder: (context,url)=>Center(child: CircularProgressIndicator(),),
            errorWidget: (context,url,error)=>Icon(Icons.error),
          ),
          SizedBox(height: 10,),
          Text(news.author??"",style: TextStyle(
            color: Color.fromRGBO(121, 130, 139,0.1),
          ),),
          SizedBox(height: 10,),
          Text(news.title??""),
          SizedBox(height: 10,),
          Container(
            margin: EdgeInsets.all(12),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade400,
                      blurRadius: 0.5,
                      offset: Offset(1,2),
                      spreadRadius: 10
                  )
                ],
                borderRadius: BorderRadius.circular(15)
            ),
          child: Text(news.description??"")),
          SizedBox(height: 10,),
          InkWell(
            onTap: (){
              _launchUrl(Uri.parse(news.url??""));
            },
            child: Container(
              margin: EdgeInsets.only(top:10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const[
                  Text('View full article',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black45,
                    fontSize: 14
                  ),),
                  Icon(Icons.arrow_forward_ios,color: Colors.black45,size: 28,)
                ],
              ),
            ),
          )

        ],
      ),
    ),
borderRadius: BorderRadius.circular(15),
  )
],
      ),
    );
  }
Future<void> _launchUrl(Uri url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
}
