import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mystore_project/Category/category/index.dart';
import 'package:mystore_project/Universal/widgets/category_item.dart';
import 'package:mystore_project/Universal/widgets/customLoading.dart';

class CategoryScreen extends StatefulWidget {
  final CategoryBloc categoryBloc;
  const CategoryScreen(this.categoryBloc);

  @override
  CategoryScreenState createState() {
    return CategoryScreenState();
  }
}

class CategoryScreenState extends State<CategoryScreen> {
  CategoryScreenState();

  @override
  void initState() {
    super.initState();
    widget.categoryBloc.add(LoadCategoryEvent());
  }

  @override
  void dispose() {
    super.dispose();
    widget.categoryBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
        bloc: widget.categoryBloc,
        builder: (
          BuildContext context,
          CategoryState currentState,
        ) {
          if (currentState is UnCategoryState) {
            return Center(
              child: CustomLoading(),
            );
          } else if (currentState is ErrorCategoryState) {
            return Center(child: Text('Error'));
          } else if (currentState is InCategoryState) {
            return Container(
              child: GridView.builder(
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: currentState.categories.length,
                padding: EdgeInsets.all(15.0),
                itemBuilder: (BuildContext context, index) {
                  return CategoryItem(currentState.categories[index], index);
                },
              ),
            );
          } else
            return Center(
              child: CustomLoading(),
            );
        });
  }
}
