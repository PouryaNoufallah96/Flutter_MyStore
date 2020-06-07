import 'package:mystore_project/models/product.dart';
import 'package:mystore_project/search/search/index.dart';

class SearchRepository {
  final SearchProvider _searchProvider = SearchProvider();

  SearchRepository();

  Future<List<Product>> searchAsync(String search) async {
    return await _searchProvider.searchAsync(search);
  }
}
