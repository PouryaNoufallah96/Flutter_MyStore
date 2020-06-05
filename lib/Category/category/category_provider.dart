import 'dart:async';
import 'dart:convert' as convert;
import 'category_model.dart';

class CategoryProvider {
  Future<List<CategoryModel>> getCategories() async {
    await Future.delayed(Duration(seconds: 1));
    List<CategoryModel> categoriesList = [];
    var categoriesData =
        "[{\"id\":1,\"name\":\"Mobile\"},{\"id\":2,\"name\":\"Web\"},{\"id\":3,\"name\":\"Desktop\"},{\"id\":4,\"name\":\"Gaming\"},{\"id\":5,\"name\":\"Cloud\"},{\"id\":6,\"name\":\"UI & Design\"},{\"id\":7,\"name\":\"Security\"},{\"id\":8,\"name\":\"Seo\"}]";
    List convertedData = convert.jsonDecode(categoriesData);
    for (int i = 0; i < convertedData.length; i++) {
      var current = convertedData[i];
      categoriesList.add(new CategoryModel(current['id'], current['name']));
    }
    return categoriesList;
  }
}
