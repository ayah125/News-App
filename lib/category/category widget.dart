import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/category/category_tab.dart';

import 'package:newsapp/core/model/SourcesResponse.dart';
import 'package:newsapp/view/category_grid_view.dart';

import '../core/api/api manager.dart';
class categorynews extends StatelessWidget {
Category category;
categorynews(this.category);
  @override
  Widget build(BuildContext context) {
    return Container(
child: FutureBuilder<SourcesResponse>(
    future: ApiManager.getSources(category.CategoryId),

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
      var sources=snapshot.data?.sources;
      return CategoryTab(sources!);

    }),
    );
  }
}
