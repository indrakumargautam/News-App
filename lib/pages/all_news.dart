import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../Services/news.dart';
import '../Services/slider_data.dart';
import '../model/article_model.dart';
import '../model/slider_model.dart';
import 'article_view.dart';

class AllNews extends StatefulWidget {
String news;

AllNews({required this.news});
  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  List<SliderModel> sliders=[];
  List<ArticleModel> articles=[];

  @override
  void initState() {
    getSlider();
    getNews();
    super.initState();
  }

  getNews()async{
    News newsclass = News();
    await newsclass.getNews();
    articles=newsclass.news;
    setState(() {

    });

  }

  getSlider()async{
    Sliders slider = Sliders();
    await slider.getSlider();
    sliders = slider.sliders;
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.news+"News",
          style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.w500),),
        centerTitle: true,
        elevation: 0.0,

      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount:widget.news=="Breaking"? sliders.length:articles.length,
            itemBuilder: (context,index){
              return AllNewsSection(
                  image: widget.news=="Breaking"? sliders[index].urlToImage!:articles[index].urlToImage!,
                  des: widget.news=="Breaking"? sliders[index].description!:articles[index].description!,
                  title:widget.news=="Breaking"? sliders[index].title!:articles[index].title!,
                  url:widget.news=="Breaking"? sliders[index].url!:articles[index].url!,);
            }),
      ),
    );
  }
}

class AllNewsSection extends StatelessWidget {

  String image,des,title,url;

  AllNewsSection({required this.image,required this.des,required this.title,required this.url});

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