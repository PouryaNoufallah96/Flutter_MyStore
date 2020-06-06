import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:mystore_project/Universal/widgets/customLoading.dart';
import 'package:mystore_project/Universal/widgets/product_card.dart';
import 'package:mystore_project/product/product_list/product_list/index.dart';

class ProductListScreen extends StatefulWidget {
  @override
  ProductListScreenState createState() {
    return ProductListScreenState();
  }
}

class ProductListScreenState extends State<ProductListScreen> {
  ProductListScreenState();
  ProductListBloc productListBloc;
  ScrollController scrollController;
  @override
  void initState() {
    super.initState();
    productListBloc = ProductListBloc();
    productListBloc.add(LoadProductListEvent());
    scrollController = new ScrollController();
    scrollController.addListener(scrollListener);
  }

  @override
  void dispose() {
    super.dispose();

    scrollController.removeListener(scrollListener);
    productListBloc.close();
  }

  scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      productListBloc.add(LoadProductListEvent());
    }
  }

  Widget loadMore() {
    if (productListBloc.isFinished) {
      return Container(
        width: 1.0,
        height: 1.0,
      );
    } else {
      return CustomLoading();
    }
  }

  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      onRefresh: () async {
        productListBloc.add(LoadProductListEvent());
      },
      child: BlocBuilder<ProductListBloc, ProductListState>(
          bloc: productListBloc,
          builder: (
            BuildContext context,
            ProductListState currentState,
          ) {
            if (currentState is UnProductListState) {
              return Center(
                child: CustomLoading(),
              );
            } else if (currentState is ErrorProductListState) {
              return Center(
                child: Text('Error'),
              );
            } else if (currentState is InProductListState) {
              return ListView(controller: scrollController, children: <Widget>[
                GridView.builder(
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: currentState.mylist.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.all(5.0),
                  itemBuilder: (BuildContext context, index) {
                    return ProductCard(currentState.mylist[index]);
                  },
                ),
                loadMore(),
              ]);
            } else
              return Center(
                child: CustomLoading(),
              );
          }),
    );
  }
}
