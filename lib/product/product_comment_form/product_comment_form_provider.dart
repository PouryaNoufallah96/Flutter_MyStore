import 'dart:async';

import '../../models/comment.dart';

class ProductCommentFormProvider {
  Future<void> sendAsync(Comment comment, List<Comment> comments) async {
    await Future.delayed(Duration(seconds: 2));
    comments.add(comment);
  }
}
