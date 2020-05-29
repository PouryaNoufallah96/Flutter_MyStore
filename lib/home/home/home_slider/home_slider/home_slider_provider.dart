import 'dart:convert' as convert;

import 'package:mystore_project/models/product.dart';

class HomeSliderProvider {
  Future<List<Product>> getSliders() async {
    await Future.delayed(Duration(seconds: 1));
    List<Product> sliders = [];
    var sliderData =
        "[{\"id\":23,\"name\":\"BitCoin\",\"purchased\":false,\"favoite\":false,\"price\":20,\"description\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\",\"image\":\"https:\/\/toplearn.com\/img\/course\/img-course-%D8%AC%D9%85%D8%B9%D9%87-%DB%B2%DB%B2-%D9%81%D8%B1%D9%88%D8%B1%D8%AF%DB%8C%D9%86-%DB%B1%DB%B3%DB%B9%DB%B9-6382684-1312.jpg\"},{\"id\":24,\"name\":\"PHP Advanced\",\"purchased\":false,\"favoite\":false,\"price\":30,\"description\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\",\"image\":\"https:\/\/toplearn.com\/img\/course\/img-course-%DA%86%D9%87%D8%A7%D8%B1-%D8%B4%D9%86%D8%A8%D9%87-%DB%B2-%D9%85%D8%B1%D8%AF%D8%A7%D8%AF-%DB%B1%DB%B3%DB%B9%DB%B8-86014733-549.jpg\"},{\"id\":25,\"name\":\"JavaScript Advanced\",\"purchased\":false,\"favoite\":false,\"price\":50,\"description\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\",\"image\":\"https:\/\/toplearn.com\/img\/course\/img-course-%D8%AF%D9%88-%D8%B4%D9%86%D8%A8%D9%87-%DB%B1%DB%B5-%D8%A7%D8%B1%D8%AF%DB%8C%D8%A8%D9%87%D8%B4%D8%AA-%DB%B1%DB%B3%DB%B9%DB%B9-68465385-805.jpg\"}]";
    List convertedData = convert.jsonDecode(sliderData);
    for (int i = 0; i < convertedData.length; i++) {
      var current = convertedData[i];
      sliders.add(new Product(
          name: current['name'],
          favorite: current['favorite'],
          purchased: current['purchased'],
          image: current['image'],
          price: current['price'],
          description: current['description']));
    }
    return sliders;
  }
}
