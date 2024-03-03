import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as ht;
import 'package:uhuru_news/model/category_news_model.dart';


class CategoryRepository {
  Future<CategoryNewsModel> fetchCategorieNewsApi(String channelName)async{
     String url ='https://gnews.io/api/v4/top-headlines?category=$channelName&lang=en&country=us&max=10&apikey=7d811f56ffa36a0534a945379b0bfc06';
     final response = await ht.get(Uri.parse(url));
     if (kDebugMode) {
       print(response.body);
     }
    
      // ignore: prefer_typing_uninitialized_variables
      var  body;
     if (response.statusCode==200) {
      body = jsonDecode(response.body);
       
     }
     return CategoryNewsModel.fromJson(body);
  }
}
