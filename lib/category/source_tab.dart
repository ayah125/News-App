import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/core/model/Sources.dart';
class SourceTab extends StatelessWidget {
Source source;
bool isselected;
SourceTab(this.source,this.isselected);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isselected?Theme.of(context).primaryColor:Colors.transparent,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color:Theme.of(context).primaryColor,width: 1)
      ),
child: Text(source.name??"",style: TextStyle(
  color: isselected?Colors.white:Theme.of(context).primaryColor
),),
    );
  }
}
