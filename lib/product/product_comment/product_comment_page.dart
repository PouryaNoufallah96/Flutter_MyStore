import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:mystore_project/Universal/MyScafold.dart';
import 'package:mystore_project/product/product_comment/index.dart';

class ProductCommentPage extends StatefulWidget {
  final String productName;
  ProductCommentPage(this.productName);
  @override
  _ProductCommentPageState createState() => _ProductCommentPageState();
}

class _ProductCommentPageState extends State<ProductCommentPage> {
  ProductCommentBloc bloc;
  ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    bloc = ProductCommentBloc();
    bloc.lazyLoad = true;
    bloc.add(LoadProductCommentEvent());
    _scrollController = new ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      bloc.add(LoadProductCommentEvent());
    } else if (_scrollController.offset <=
            _scrollController.position.minScrollExtent &&
        !_scrollController.position.outOfRange) {}
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var productName = widget.productName;
    return MyScaffold(
      title: '$productName Comments',
      body: LiquidPullToRefresh(
        onRefresh: () async {
          bloc.forceRefresh = true;
          bloc.add(LoadProductCommentEvent());
        },
        child: SingleChildScrollView(
          controller: _scrollController,
          child: ProductCommentScreen(bloc),
        ),
      ),
    );
  }
}
