import 'package:fundamental/news-app/data/model/article.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String _baseUrl = 'http://newsapi.org/v2/';
  static const String _apiKey = '79537d6ebe68416281ca40bdaabd0f99';
  static const String _category = 'business';
  static const String _country = 'id';

  Future<ArticlesResult> topHeadlines() async {
    final response = await http.get(Uri.parse("${_baseUrl}top-headlines?country=$_country&category=$_category&apiKey=$_apiKey"));
    if(response.statusCode == 200) {
      return ArticlesResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
}