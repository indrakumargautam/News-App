import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/show_category.dart';
import 'package:news_app/pages/article_view.dart';

import '../Services/show_category_news.dart';

class CategoryNews extends StatefulWidget {

  String name;
  CategoryNews({required this.name});
  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {

  List<ShowCategoryModel> categories=[];
  bool loading =true;
  @override
  void initState(){
    super.initState();
    getNews();
  }

  getNews()async{
    ShowCategoryNews showCategoryNews = ShowCategoryNews();
    await showCategoryNews.getCategoryNews(widget.name.toLowerCase());
    categories=showCategoryNews.categoris;
    setState(() {
      loading=false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.name,style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.w500),),
        centerTitle: true,
        elevation: 0.0,

      ),

      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: categories.length,
            itemBuilder: (context,index){
              return ShowCategory(
                  image: categories[index].urlToImage!,
                  des: categories[index].description!,
                  title: categories[index].title!,
                url: categories[index].url!);
            }),
      ),
    );
  }
}

class ShowCategory extends StatelessWidget {

  String image,des,title,url;

  ShowCategory({required this.image,required this.des,required this.title,required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ArticleView(blogUrl: url)));
      },
      child: Container(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(imageUrl: image,width: MediaQuery.of(context).size.width,
              height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 5.0,),
            Text(title,
              maxLines:2,
              style: TextStyle(color: Colors.black,fontSize: 18,
            fontWeight: FontWeight.bold
            ),),
            Text(des,maxLines: 3,),
            SizedBox(height: 20.0,),
          ],
        ),
      ),
    );
  }
}

