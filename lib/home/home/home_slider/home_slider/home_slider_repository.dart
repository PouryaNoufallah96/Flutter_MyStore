import 'package:mystore_project/home/home/home_slider/home_slider/index.dart';
import 'package:mystore_project/models/product.dart';

class HomeSliderRepository {
  final HomeSliderProvider _homeSliderProvider = HomeSliderProvider();

  HomeSliderRepository();

  Future<List<Product>> getSliders() async {
    return await _homeSliderProvider.getSliders();
  }
}
