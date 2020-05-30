import 'package:mystore_project/product/product_comment_form/index.dart';

import '../../models/comment.dart';

class ProductCommentFormRepository {
  final ProductCommentFormProvider _productCommentFormProvider =
      ProductCommentFormProvider();

  ProductCommentFormRepository();

  void sendAsync(Comment comment, List<Comment> comments) {
    _productCommentFormProvider.sendAsync(comment, comments);
  }
}
