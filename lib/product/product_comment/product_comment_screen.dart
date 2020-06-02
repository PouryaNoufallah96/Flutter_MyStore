import 'package:flutter/material.dart';
import 'package:mystore_project/Universal/widgets/comment_card.dart';
import 'package:mystore_project/Universal/widgets/customLoading.dart';
import 'package:mystore_project/product/product_comment/index.dart';

class ProductCommentScreen extends StatefulWidget {
  final ProductCommentState currentState;
  final bool isFinished;
  ProductCommentScreen(this.currentState, this.isFinished);

  @override
  ProductCommentScreenState createState() => ProductCommentScreenState();
}

class ProductCommentScreenState extends State<ProductCommentScreen> {
  Widget loadMore() {
    if (widget.isFinished) {
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
    if (widget.currentState is UnProductCommentState) {
      return CustomLoading();
    } else if (widget.currentState is InProductCommentState) {
      return Column(
        children: <Widget>[
          ListView.builder(
              padding: EdgeInsets.all(10),
              shrinkWrap: true,
              reverse: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: widget.currentState.mylist.length,
              itemBuilder: (context, index) {
                return CommentCard(widget.currentState.mylist[index]);
              }),
          loadMore()
          // ListViewEffect(
          //     duration: Duration(milliseconds: 100),
          //     children: currentState.comments
          //         .map((s) => CommentCard(s))
          //         .toList()),
        ],
      );
    } else if (widget.currentState is NoProductCommentState) {
      return Center(
        child: Text('This product has not comment'),
      );
    } else {
      return Center(
        child: Text('Connection or server error'),
      );
    }
  }
}
