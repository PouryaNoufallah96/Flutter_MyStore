import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mystore_project/Universal/widgets/ListViewEffect.dart';
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
  Widget loadMore() {
    if (widget.bloc.isFinished) {
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
    return BlocBuilder<ProductCommentBloc, ProductCommentState>(
        bloc: widget.bloc,
        builder: (
          BuildContext context,
          ProductCommentState currentState,
        ) {
          if (currentState is UnProductCommentState) {
            return CustomLoading();
          } else if (currentState is InProductCommentState) {
            return Column(
              children: <Widget>[
                ListView.builder(
                    padding: EdgeInsets.all(10),
                    shrinkWrap: true,
                    reverse: true,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: currentState.comments.length,
                    itemBuilder: (context, index) {
                      return CommentCard(currentState.comments[index]);
                    }),
                loadMore()
                // ListViewEffect(
                //     duration: Duration(milliseconds: 100),
                //     children: currentState.comments
                //         .map((s) => CommentCard(s))
                //         .toList()),
              ],
            );
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
