import 'dart:async';

import '../../models/comment.dart';

class ProductCommentFormProvider {
  Future<void> sendAsync(Comment comment) async {
    await Future.delayed(Duration(seconds: 2));
    print("Success");
  }
}
