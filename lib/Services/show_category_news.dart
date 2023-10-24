
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/show_category.dart';
import '../model/slider_model.dart';

class ShowCategoryNews{

  List<ShowCategoryModel> categoris=[];

  Future<void> getCategoryNews(String category) async{
    String url = "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=79a00fc1211944f7abfd0400320da607";
    var response =await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);
    if(jsonData['status']=='ok'){
      jsonData['articles'].forEach((element){
        if(element['urlToImage']!=null && element['description']!=null){
          ShowCategoryModel showCategoryModel = ShowCategoryModel(
            title: element["title"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
            author: element["author"],
          );
          categoris.add(showCategoryModel);
        }
      });
    }
  }
}