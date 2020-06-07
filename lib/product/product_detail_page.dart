import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mystore_project/models/product.dart';
import 'package:mystore_project/product/product_detail_screen.dart';
import 'product_comment/index.dart';
import 'product_comment_form/index.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;
  final String tag;
  ProductDetailPage(this.product, this.tag);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ProductCommentBloc()),
          BlocProvider(create: (context) => ProductCommentFormBloc()),
        ],
        child: Material(
          child: ProductDetailScreen(product, tag),
        ));
  }
}
