import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mystore_project/Universal/widgets/customLoading.dart';
import 'package:mystore_project/Universal/widgets/product_card.dart';
import 'package:mystore_project/home/home/home_products/home_product/index.dart';

class HomeProductScreen extends StatefulWidget {
  @override
  HomeProductScreenState createState() {
    return HomeProductScreenState();
  }
}

class HomeProductScreenState extends State<HomeProductScreen> {
  HomeProductScreenState();

  HomeProductBloc homeProductBloc;
  @override
  void initState() {
    super.initState();
    homeProductBloc = HomeProductBloc();
    _load();
  }

  void _load() {
    homeProductBloc.add(LoadHomeProductEvent());
  }

  @override
  void dispose() {
    homeProductBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeProductBloc, HomeProductState>(
        bloc: homeProductBloc,
        builder: (
          BuildContext context,
          HomeProductState currentState,
        ) {
          if (currentState is UnHomeProductState) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Center(
                child: CustomLoading(),
              ),
            );
          }
          if (currentState is ErrorHomeProductState) {
            return Center(child: Text(currentState.errorMessage));
          }
          if (currentState is InHomeProductState) {
            return GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
              itemCount: currentState.products.length,
              padding: EdgeInsets.all(5.0),
              itemBuilder: (BuildContext context, index) {
                return ProductCard(currentState.products[index]);
              },
            );
          }
          return Center(
            child: CustomLoading(),
          );
        });
  }
}
