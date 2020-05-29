import 'package:mystore_project/home/home/home_products/home_product/index.dart';
import 'package:mystore_project/models/product.dart';

class HomeProductRepository {
  final HomeProductProvider _homeProductProvider = HomeProductProvider();

  HomeProductRepository();

  Future<List<Product>> getProducts() async {
    return await _homeProductProvider.getProducts();
  }
}
