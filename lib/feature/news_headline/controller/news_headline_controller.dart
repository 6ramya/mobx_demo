import 'package:mobx/mobx.dart';
import 'package:mobx_demoo/core/model/article_model.dart';
import 'package:mobx_demoo/core/repository/news_repo_impl.dart';
import 'package:mobx_demoo/core/repository/news_repository.dart';

part 'news_headline_controller.g.dart';

class NewsHeadlineControllerStore = NewsHeadlineController
    with _$NewsHeadlineControllerStore;

abstract class NewsHeadlineController with Store {
  late NewsRepo _newsRepo;

  NewsHeadlineController() {
    _newsRepo = NewsRepoImpl();
    loadNewsLine();
  }

  @observable
  bool isLoading = false;

  @observable
  List<Article> articles = [];

  @action
  loadNewsLine() async {
    showLoading();
    final result = await _newsRepo.getNewsHeadline();
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
