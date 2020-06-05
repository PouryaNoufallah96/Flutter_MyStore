import 'package:mystore_project/models/product.dart';
import 'package:mystore_project/product/product_list/product_list/index.dart';

class ProductListRepository {
  final ProductListProvider _productListProvider = ProductListProvider();

  ProductListRepository();

  Future<List<Product>> getProducts(int skip) async {
    return await _productListProvider.getProducts(skip);
  }
}
