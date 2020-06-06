import 'package:flutter/material.dart';
import 'package:mystore_project/models/product.dart';
import 'package:mystore_project/product/product_detail_page.dart';
import 'package:mystore_project/utilities/random.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  ProductCard(this.product);
  @override
  Widget build(BuildContext context) {
    var tag = MyRandom.getRandom();
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetailPage(product, tag)));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            gradient: LinearGradient(colors: [
              Theme.of(context).accentColor,
              Theme.of(context).cursorColor
            ])),
        child: Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.vertical,
          children: <Widget>[
            Hero(
                tag: tag,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Image(
                    image: NetworkImage(product.image),
                    fit: BoxFit.cover,
                  ),
                )),
            Text('${product.name}',
                style: TextStyle(fontWeight: FontWeight.w600)),
            Text(
              '${product.price} \$ ',
              style: TextStyle(
                  color: Colors.green[500], fontWeight: FontWeight.w500),
            ),
            SizedBox()
          ],
        ),
      ),
    );
  }
}
