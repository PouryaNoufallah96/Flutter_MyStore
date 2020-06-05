import 'package:flutter/material.dart';
import 'package:mystore_project/Universal/MyScafold.dart';
import 'package:mystore_project/product/product_list/product_list/index.dart';

class ProductListPage extends StatefulWidget {
  static const String routeName = '/productList';
  final String categoryName;
  ProductListPage(this.categoryName);
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: widget.categoryName + ' Products ',
      body: ProductListScreen(),
    );
  }
}
