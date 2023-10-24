import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/pages/article_view.dart';

class BlogTile extends StatelessWidget {
  String imageUrl, title , dec,url;
  BlogTile({required this.title,required this.imageUrl,required this.dec,required this.url});
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ArticleView(blogUrl: url)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Material(
            elevation: 3.0,
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(imageUrl:imageUrl
                          ,height: 120,width: 120,fit: BoxFit.cover,)),
                  ),
                  SizedBox(width: 8,),
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width/1.8,
                        child: Text(title,maxLines: 2,
                            style: TextStyle(color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 17)),
                      ),
                      SizedBox(height: 7,),
                      Container(
                        width: MediaQuery.of(context).size.width/1.8,
                        child: Text(dec,maxLines: 3,
                            style: TextStyle(color: Colors.black54,
                                fontWeight: FontWeight.w500,
                                fontSize: 15)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

  }
}
