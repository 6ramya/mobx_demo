import 'package:mobx_demoo/core/model/article_model.dart';

abstract class NewsRepo {
  Future<List<Article>?> getNewsHeadline();
  Future<List<Article>?> getSearchedNews(String query);
}
