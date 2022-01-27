import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_demoo/core/model/article_model.dart';
import 'package:mobx_demoo/core/repository/news_repo_impl.dart';
import 'package:mobx_demoo/core/repository/news_repository.dart';

part 'search_news_controller.g.dart';

class SearchNewsControllerStore = SearchNewsController
    with _$SearchNewsControllerStore;

abstract class SearchNewsController with Store {
  late NewsRepo _newsRepo;

  SearchNewsController() {
    _newsRepo = NewsRepoImpl();

    searchTextController.addListener(() {
      if (searchTextController.text.length % 3 == 0 &&
          searchTextController.text.length != 0) {
        searchNewsHeadline();
      }
    });
  }

  final searchTextController = TextEditingController();

  @observable
  bool isLoading = false;

  @observable
  List<Article> articles = [];

  @action
  searchNewsHeadline() async {
    showLoading();
    final result = await _newsRepo.getSearchedNews(searchTextController.text);
    hideLoading();
    if (result != null) {
      articles = result;
    } else {
      print("no data received");
    }
  }

  showLoading() {
    isLoading = true;
  }

  hideLoading() {
    isLoading = false;
  }
}
