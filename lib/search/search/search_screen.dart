import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mystore_project/Universal/widgets/SearchBox.dart';
import 'package:mystore_project/Universal/widgets/customLoading.dart';
import 'package:mystore_project/Universal/widgets/product_card.dart';
import 'package:mystore_project/search/search/index.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen(this._searchBloc, {SearchBloc searchBloc});

  final SearchBloc _searchBloc;

  @override
  SearchScreenState createState() {
    return SearchScreenState();
  }
}

class SearchScreenState extends State<SearchScreen> {
  SearchScreenState();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    widget._searchBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      SearchBox(widget._searchBloc),
      BlocBuilder<SearchBloc, SearchState>(
          bloc: widget._searchBloc,
          builder: (
            BuildContext context,
            SearchState currentState,
          ) {
            if (currentState is UnSearchState) {
              return Container();
            } else if (currentState is SearchingState) {
              return CustomLoading();
            } else if (currentState is ErrorSearchState) {
              return Text('Error');
            } else if (currentState is InSearchState) {
              return GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: currentState.products.length,
                padding: EdgeInsets.all(5.0),
                itemBuilder: (BuildContext context, index) {
                  return ProductCard(currentState.products[index]);
                },
              );
            } else if (currentState is NoSearchState) {
              return Center(
                child: Text("Nothing found"),
              );
            } else
              return CustomLoading();
          }),
    ]);
  }
}
