import 'package:flutter/material.dart';
import 'package:news_app/pages/category_news.dart';
class CategoryTile extends StatelessWidget {
  final image, categoryName;

  CategoryTile({this.categoryName,this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryNews(name: categoryName)));
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(image,
                width: 120,
                height: 70,fit: BoxFit.cover,),
            ),
            Container(
              height: 70,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(6)
              ),

              child: Center(child: Text(categoryName,style: TextStyle(color: Colors.white,
                  fontSize: 14,fontWeight:FontWeight.w500 ),)),
            )
          ],
        ),
      ),
    );
  }
}
