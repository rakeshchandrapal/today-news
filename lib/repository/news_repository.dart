import 'dart:convert';
import 'dart:developer' as dev;
import 'package:http/http.dart' as http;

import '../models/news_model.dart';

class NewsRepository {
  final Uri url = Uri.parse(
    "https://newsapi.org/v1/articles?source=the-verge&apiKey=cef90d262b654ffa9f4c1bdf5b40e40b",
  );

  Future<List<NewsModel>> getList() async {
    final result = await http.get(url);

    final List<dynamic> data = json.decode(result.body)["articles"];
    final List<NewsModel> list = [];
    dev.log(data.toString());
    for(Map<String,dynamic> e in data){
      list.add(NewsModel.fromMap(e));
    }
    dev.log(list.toString());
    return list;
  }
}
