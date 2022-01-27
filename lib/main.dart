import 'package:flutter/material.dart';
import 'package:mobx_demoo/feature/news_headline/view/news_headline_view.dart';
import 'package:mobx_demoo/feature/search_news/view/search_news_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(primaryColor: Colors.blueGrey),
        initialRoute: "/news_headline",
        routes: {
          '/news_headline': (ontext) => NewsHeadlineView(),
          '/search_news': (context) => SearchNewsView()
        });
  }
}
