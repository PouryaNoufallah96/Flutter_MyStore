import 'package:flutter/material.dart';
import 'package:mystore_project/Category/category/index.dart';
import 'package:mystore_project/Universal/MyScafold.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: CategoryScreen(CategoryBloc()),
      title: "Categories",
    );
  }
}
