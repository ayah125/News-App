import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryGridView extends StatelessWidget {
  int index;
  Category category;
  Function onclickItem;
  CategoryGridView({ required this.category,required this.index,required this.onclickItem});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onclickItem(category);
      },
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: category.CategoryBackGround,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(index%2==0 ?20:0),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(index%2==0 ?0:20),
          topLeft: Radius.circular(20)
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
      category.CategoryImage
            ),
            Text(category.Categorytitle,style:Theme.of(context).textTheme.headline6,)
          ],
        ),
      ),
    );
  }
}
class Category{
  String CategoryId;
  String CategoryImage;
  String Categorytitle;
  Color CategoryBackGround;
  Category(
      {
         required this.CategoryId,
        required this.CategoryImage,
         required this.Categorytitle,
        required this.CategoryBackGround});
}