import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Services/data.dart';
import 'package:news_app/Services/news.dart';
import 'package:news_app/Services/slider_data.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/pages/all_news.dart';
import 'package:news_app/pages/blog_tile.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../model/category_model.dart';
import '../model/slider_model.dart';
import 'category_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categoris = [];
  List<SliderModel> sliders=[];
  List<ArticleModel> articles=[];
  bool loading = true;

  int activeIndex=0;
  @override
  void initState() {
    categoris = getCategories();
    getSlider();
    getNews();
    super.initState();
  }
  getNews()async{
News newsclass = News();
await newsclass.getNews();
articles=newsclass.news;
setState(() {
  loading=false;
});
  }

  getSlider()async{
    Sliders slider = Sliders();
    await slider.getSlider();
    sliders = slider.sliders;
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('𝐍𝐞𝐰𝐬',style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.w500),),
        centerTitle: true,
        elevation: 0.0,

      ),
      body: loading? Center(child: CircularProgressIndicator()):SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10.0),
                height: 70,
                child: ListView.builder(
                  shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: categoris.length,
                    itemBuilder:(context,index){
                      return CategoryTile(
                        image: categoris[index].image,
                        categoryName: categoris[index].categoryName,

                      );
                    }),
              ),
              SizedBox(height: 30,),
              Padding(
                padding: EdgeInsets.only(left: 10,right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Breaking News!',style: TextStyle(color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,)),

                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>AllNews(news: 'Breaking')));
                      },
                      child: Text('View All',style: TextStyle(color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 16)),
                    ),
                  ],
                )
              ),

              SizedBox(height: 20,),

              CarouselSlider.builder(
                  itemCount: 5,
                  itemBuilder: (context,index ,realindex){
                    String? res =sliders[index].urlToImage;
                    String? res1 = sliders[index].title;
                    return buildImage(res!, index, res1!);
                  },
                  options: CarouselOptions(
                    height: 250,
                      enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    autoPlay: true,
                    onPageChanged: (index, reason){
                      setState(() {
                        activeIndex = index;
                      });
                    }
                  )),
              SizedBox(
                height: 30,),
              Center(
                child: buildInIndicator(),
              ),
              SizedBox(height: 30),
              Padding(
                  padding: EdgeInsets.only(left: 10,right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Trending News!',style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),

                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AllNews(news: 'Tranding')));
                        },
                        child: Text('View All',style: TextStyle(color: Colors.blue,
                            fontWeight: FontWeight.w500,
                            fontSize: 16)),
                      ),
                    ],
                  )
              ),
              SizedBox(height: 10),
              Container(
                child: ListView.builder(
                  shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: articles.length,
                    itemBuilder: (context,index){
                      return BlogTile(
                        url: articles[index].url!,
                          title: articles[index].title!,
                          imageUrl: articles[index].urlToImage!,
                          dec: articles[index].description!);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildImage(String image, int index ,String name)=>
      Container(
    margin: EdgeInsets.symmetric(horizontal: 5),
    child: Stack(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: image
              ,height:250 ,fit: BoxFit.cover,width: MediaQuery.of(context).size.width,)),
        Container(
          height: 250,
          padding: EdgeInsets.only(left: 10),
          margin: EdgeInsets.only(top: 170),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)
            )
          ),
          child: Text(name ,maxLines:2,style: TextStyle(color: Colors.white,fontSize: 20,
              fontWeight: FontWeight.bold),),
        ),
      ],
    ),
  );

  Widget buildInIndicator()=> AnimatedSmoothIndicator(activeIndex: activeIndex, count: 5,
  effect: SlideEffect(dotHeight: 15,dotWidth: 15,dotColor: Colors.blue),
  );
}
