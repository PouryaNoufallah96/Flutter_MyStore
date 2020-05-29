import 'package:mystore_project/models/comment.dart';
import 'package:mystore_project/product/product_comment/index.dart';

class ProductCommentRepository {
  final ProductCommentProvider _productCommentProvider =
      ProductCommentProvider();

  ProductCommentRepository();

  Future<List<Comment>> getComments(int skip) async =>
      await _productCommentProvider.getComments(skip);
}
