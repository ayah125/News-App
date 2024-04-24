import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newsapp/category/source_tab.dart';
import 'package:newsapp/news/news_list.dart';

import '../core/model/Sources.dart';

class CategoryTab extends StatefulWidget {
  List<Source> sources;

  CategoryTab(this.sources);

  @override
  State<CategoryTab> createState() => _CategoryTabState();
}

class _CategoryTabState extends State<CategoryTab> {
  int selectedindex=0;

  @override
  Widget build(BuildContext context) {
    return Container(
padding: EdgeInsets.all(8),
      child: DefaultTabController(
        length: widget.sources.length,
        child: Column(
          children: [
            TabBar(
              onTap: (index){
                setState(() {
                  selectedindex=index;
                });
              },
              indicatorColor: Colors.transparent,
              isScrollable: true
              ,
                tabs:

                widget.sources.map((item) =>
                    SourceTab( item,widget.sources.indexOf(item)==selectedindex)).toList(),
            ),
            Expanded(child: NewsList(widget.sources[selectedindex])),
          ],
        ),
      ),
    );
  }
}
