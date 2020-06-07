import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mystore_project/Universal/widgets/comment_card.dart';
import 'package:mystore_project/Universal/widgets/customLoading.dart';
import 'package:mystore_project/product/product_comment/index.dart';

class ProductCommentScreen extends StatefulWidget {
  final ProductCommentBloc bloc;
  ProductCommentScreen(this.bloc);

  @override
  ProductCommentScreenState createState() => ProductCommentScreenState();
}

class ProductCommentScreenState extends State<ProductCommentScreen> {
  @override
  void initState() {
    super.initState();
    widget.bloc.add(LoadProductCommentEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCommentBloc, ProductCommentState>(
        bloc: widget.bloc,
        builder: (
          BuildContext context,
          ProductCommentState currentState,
        ) {
          if (currentState is UnProductCommentState) {
            return CustomLoading();
          } else if (currentState is InProductCommentState) {
            return ListView.builder(
                padding: EdgeInsets.all(10),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: currentState.comments.length,
                itemBuilder: (context, position) {
                  return new CommentCard(currentState.comments[position]);
                });
          } else if (currentState is NoProductCommentState) {
            return Center(
              child: Text('This product has not comment'),
            );
          } else {
            return Center(
              child: Text('Connection or server error'),
            );
          }
        });
  }
}
