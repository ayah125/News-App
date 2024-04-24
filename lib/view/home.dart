import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/news/search.dart';


import '../category/category widget.dart';
import 'category_grid_view.dart';

class Home_view extends StatefulWidget {
  static const String routeName='HomeView';

  @override
  State<Home_view> createState() => _Home_viewState();
}

class _Home_viewState extends State<Home_view> {
  List<Category> category=[
 Category(CategoryId: "Sports", CategoryImage: "assets/images/ball.png",
     Categorytitle: "Sports", CategoryBackGround: Colors.red),
    Category(CategoryId: "general", CategoryImage: "assets/images/Politics.png",
        Categorytitle: "politics", CategoryBackGround: Color(0xFF003E90)),
    Category(CategoryId: "health", CategoryImage: "assets/images/health.png",
        Categorytitle: "Health", CategoryBackGround: Color(0xFFED1E79)),
    Category(CategoryId: "business", CategoryImage: "assets/images/bussines.png",
        Categorytitle: "business", CategoryBackGround: Color(0xFFCF7E48)),
    Category(CategoryId: "entertainment", CategoryImage: "assets/images/environment.png",
        Categorytitle: "Environment", CategoryBackGround: Color(0xFF4882CF)),
    Category(CategoryId: "Science",
        CategoryImage: "assets/images/science.png",

        Categorytitle: "Science",
        CategoryBackGround: const Color.fromARGB(255, 242, 211, 82)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
elevation: 0,
        title:  Text(
selectedCategory==null?
          'News App' :
selectedCategory!.Categorytitle!
          ,style: TextStyle(
          color: Colors.white,
          fontSize: 22,
fontWeight: FontWeight.w400
        ),),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
shape:  const RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
bottomLeft: Radius.circular(28),
    bottomRight: Radius.circular(28)
  )
),
        actions: [
          selectedCategory!=null?
          InkWell(
onTap: (){
  Navigator.pushNamed(context, SearchScreen.routeName);
},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(Icons.search,color: Colors.white,size: 28,),
            ),
          ):SizedBox(),
        ],
      ),
      drawer: Drawer(
child:  Column(
  children: [
    Container(
      padding: EdgeInsets.symmetric(vertical:45),
      width: double.infinity,
      height: 120,
      color: Colors.green,
      child: const Text(
        "News App!",
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),
        textAlign: TextAlign.center,
      ),

    ),
    SizedBox(height: 20,),
    ElevatedButton(onPressed: (){},
        child: InkWell(
          onTap: (){
            setState(() {
              selectedCategory=null;
              Navigator.pop(context);
            });
          },
          child: Row(
                children: [
          Icon(
            Icons.menu,
            color: Colors.black,
          ),
          SizedBox(width: 5,),
          Text("Categories",style: TextStyle(
            color: Colors.black
          ),)
                ],
              ),
        )),
    SizedBox(height: 9,),
    ElevatedButton(onPressed: (){}, child: Row(
      children: [
        Icon(
          Icons.settings,
          color: Colors.black,
        ),
        SizedBox(width: 5,),
         Text("settings",style: TextStyle(
            color: Colors.black
        ),)
      ],
    )),
  ],
),
      ),
      body: selectedCategory==null?
      Container(
        padding: EdgeInsets.all(10),
        child: Stack(
          children: [
          Container(
            color: Colors.white,
            child: Image.asset('assets/images/pattern.png',
                width: double.infinity,
                height: double.infinity,
                fit:BoxFit.cover
            ),

          ),
           Column(

            children: [
              Text(
          'Pick your category \n of interest',
          style: Theme.of(context).textTheme.headline6!.copyWith(
            color: Colors.black38
          )
              ),
             Expanded(
               child: GridView.builder(
                 padding: EdgeInsets.symmetric(horizontal: 10),
          gridDelegate:const  SliverGridDelegateWithFixedCrossAxisCount(
           crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 6/7,

          ),
           itemBuilder:(context,index)=> CategoryGridView(
          index: index,
          category: category[index],
             onclickItem:onclick ,
           ),
          itemCount: category.length,
           ),
             ),
          ],
          ),
        ],
        ),

      ):categorynews(selectedCategory!),


    );

  }
  Category? selectedCategory=null;
  void onclick(Category category) {
setState(() {
  selectedCategory=category;
});
  }
  }
