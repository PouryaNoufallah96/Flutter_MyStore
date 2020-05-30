import 'dart:async';

import '../../models/comment.dart';
import '../product_comment/product_comment_bloc.dart';

class ProductCommentFormProvider {
  Future<void> sendAsync(Comment comment) async {
    await Future.delayed(Duration(seconds: 2));
    var commentList = ProductCommentBloc().mylist;
    commentList.insert(commentList.length + 1, comment);
  }
}
