import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_demoo/core/widget/drawer.dart';
import 'package:mobx_demoo/feature/news_headline/controller/news_headline_controller.dart';

class NewsHeadlineView extends StatelessWidget {
  const NewsHeadlineView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewsHeadlineControllerStore controller = NewsHeadlineControllerStore();
    return Scaffold(
        appBar: AppBar(title: Text('News Headline'), centerTitle: true),
        drawer: AppDrawer(),
        body: Observer(builder: (context) {
          return controller.isLoading == 'true'
              ? Center(child: CircularProgressIndicator())
              : Container(
                  margin: const EdgeInsets.all(10),
                  child:
                      //  StaggeredGridView.countBuilder(
                      //   itemCount: controller.articles.length,
                      //   crossAxisCount: 4,
                      //   mainAxisSpacing: 4,
                      //   crossAxisSpacing: 8,
                      //   staggeredTileBuilder: (index) =>
                      //       StaggeredTile.count(2, index.isEven ? 3 : 2),
                      //   itemBuilder: (context, index) {
                      //     return Column(
                      //       children: [
                      //         controller.articles[index].imageUrl != null
                      //             ? Image.network(
                      //                 controller.articles[index].imageUrl!,
                      //                 fit: BoxFit.contain,
                      //               )
                      // : Container(),
                      // SizedBox(
                      // height: 6,
                      // ),
                      // Text(controller.articles[index].title!),
                      // ],
                      // );
                      ListView.separated(
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                controller.articles[index].imageUrl == null
                                    ? Container()
                                    : Image.network(
                                        controller.articles[index].imageUrl!),
                                SizedBox(height: 8),
                                Text(
                                  controller.articles[index].title!,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 4),
                                Text(controller.articles[index].description!),
                              ],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider();
                          },
                          itemCount: 10),
                );
        }));
  }
}
