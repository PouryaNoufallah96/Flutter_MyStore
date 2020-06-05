import 'package:mystore_project/Category/category/index.dart';

class CategoryRepository {
  final CategoryProvider _categoryProvider = CategoryProvider();

  CategoryRepository();

  Future<List<CategoryModel>> getCategories() async {
    return await _categoryProvider.getCategories();
  }
}
