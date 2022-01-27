import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        ListTile(
            title: Text("News Headline"),
            onTap: () {
              Navigator.pushNamed(context, '/news_headline');
            },
            leading: Icon(Icons.contact_page_outlined)),
        ListTile(
            title: Text("Search News"),
            onTap: () {
              Navigator.pushNamed(context, '/search_news');
            },
            leading: Icon(Icons.search)),
      ],
    ));
  }
}
