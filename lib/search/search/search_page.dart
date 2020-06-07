import 'package:flutter/material.dart';
import 'package:mystore_project/Universal/MyScafold.dart';
import 'package:mystore_project/search/search/index.dart';

class SearchPage extends StatefulWidget {
  static const String routeName = '/search';

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: "Search",
      body: SearchScreen(SearchBloc()),
    );
  }
}
