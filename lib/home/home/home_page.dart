import 'package:flutter/material.dart';
import 'package:mystore_project/Universal/MyScafold.dart';
import 'package:mystore_project/home/home/home_products/home_product/home_product_screen.dart';
import 'package:mystore_project/home/home/home_slider/home_slider/index.dart';
import 'package:mystore_project/product/product_list/product_list/product_list_page.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var edgeInsets = EdgeInsets.all(5);
    return MyScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(children: <Widget>[
              Padding(
                padding: edgeInsets,
                child: Shimmer.fromColors(
                    baseColor: Colors.grey[700],
                    highlightColor: Colors.grey[900],
                    child: Text(
                      "Featured Products",
                      style: Theme.of(context).textTheme.headline6,
                    )),
              ),
            ]),
            SizedBox(
              height: 2,
            ),
            HomeSliderScreen(),
            SizedBox(
              height: 2,
            ),
            Padding(
              padding: edgeInsets,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Shimmer.fromColors(
                      baseColor: Colors.grey[700],
                      highlightColor: Colors.grey[900],
                      child: Text(
                        "Recent Products",
                        style: Theme.of(context).textTheme.headline6,
                      )),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductListPage('')));
                    },
                    child: Text(
                      "Show More  >",
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ),
                ],
              ),
            ),
            HomeProductScreen()
          ],
        ),
      ),
      title: "My Store",
    );
  }
}
