// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_news_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchNewsControllerStore on SearchNewsController, Store {
  final _$isLoadingAtom = Atom(name: 'SearchNewsController.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$articlesAtom = Atom(name: 'SearchNewsController.articles');

  @override
  List<Article> get articles {
    _$articlesAtom.reportRead();
    return super.articles;
  }

  @override
  set articles(List<Article> value) {
    _$articlesAtom.reportWrite(value, super.articles, () {
      super.articles = value;
    });
  }

  final _$searchNewsHeadlineAsyncAction =
      AsyncAction('SearchNewsController.searchNewsHeadline');

  @override
  Future searchNewsHeadline() {
    return _$searchNewsHeadlineAsyncAction
        .run(() => super.searchNewsHeadline());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
articles: ${articles}
    ''';
  }
}
