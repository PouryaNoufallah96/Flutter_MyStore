import 'package:flutter/material.dart';
import 'package:mystore_project/Category/category/index.dart';
import 'package:mystore_project/product/product_list/product_list/product_list_page.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;
  final int index;
  var cl1, cl2;
  CategoryItem(this.category, this.index) {
    switch (index % 5) {
      case 0:
        cl1 = Color(0xffed5565);
        cl2 = Color(0xffd62739);
        break;
      case 1:
        cl1 = Color(0xff48cfad);
        cl2 = Color(0xff19a784);
        break;
      case 2:
        cl1 = Color(0xffffda7c);
        cl2 = Color(0xfff6a742);
        break;
      case 3:
        cl1 = Color(0xff4fc1e9);
        cl2 = Color(0xff0b9bd0);
        break;
      case 4:
        cl1 = Color(0xffec87c0);
        cl2 = Color(0xffbf4c90);
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: cl1,
      focusColor: cl2,
      hoverColor: cl1,
      highlightColor: cl2,
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductListPage(category.name)));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 9.0, vertical: 15.0),
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.grey[900], blurRadius: 5.0)],
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [cl1, cl2]),
            borderRadius: BorderRadius.circular(10.0)),
        child: Center(
          child: Text(category.name),
        ),
      ),
    );
  }
}
