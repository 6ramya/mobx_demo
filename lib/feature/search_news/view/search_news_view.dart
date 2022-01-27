import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_demoo/core/widget/drawer.dart';
import 'package:mobx_demoo/feature/search_news/controller/search_news_controller.dart';

class SearchNewsView extends StatelessWidget {
  const SearchNewsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SearchNewsControllerStore controller = SearchNewsControllerStore();
    return Scaffold(
        appBar: AppBar(
          title: Text('Search News'),
          centerTitle: true,
        ),
        drawer: AppDrawer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
                controller: controller.searchTextController,
                decoration: InputDecoration(prefixIcon: Icon(Icons.search))),
            Expanded(child: Observer(builder: (context) {
              return controller.isLoading == 'true'
                  ? Center(child: CircularProgressIndicator())
                  : controller.articles.isEmpty
                      ? Center(child: Text('No News Found'))
                      : Container(
                          margin: const EdgeInsets.all(10),
                          child: ListView.separated(
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    controller.articles[index].imageUrl == null
                                        ? Container()
                                        : Image.network(controller
                                            .articles[index].imageUrl!),
                                    SizedBox(height: 8),
                                    Text(
                                      controller.articles[index].title!,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 4),
                                    Text(controller
                                        .articles[index].description!),
                                  ],
                                );
                              },
                              separatorBuilder: (context, index) {
                                return Divider();
                              },
                              itemCount: controller.articles.length),
                        );
            }))
          ],
        ));
  }
}
