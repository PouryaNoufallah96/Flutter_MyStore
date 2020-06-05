import 'dart:async';
import 'dart:convert' as convert;
import 'package:mystore_project/models/product.dart';

class ProductListProvider {
  Future<List<Product>> getProducts(int skip) async {
    await Future.delayed(Duration(seconds: 1));
    List<Product> products = [];
    var productsData =
        "[{\"id\":1,\"name\":\"pyGame\",\"purchased\":false,\"favorite\":false,\"description\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\",\"image\":\"https:\/\/toplearn.com\/img\/course\/img-course-%D8%AF%D9%88-%D8%B4%D9%86%D8%A8%D9%87-%DB%B8-%D8%A7%D8%B1%D8%AF%DB%8C%D8%A8%D9%87%D8%B4%D8%AA-%DB%B1%DB%B3%DB%B9%DB%B9-50155358-1013.jpg\",\"price\":10},{\"id\":2,\"name\":\"Matplotlib \",\"purchased\":false,\"favorite\":false,\"description\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\",\"image\":\"https:\/\/toplearn.com\/img\/course\/img-course-%D8%AF%D9%88-%D8%B4%D9%86%D8%A8%D9%87-%DB%B2%DB%B2-%D8%A7%D8%B1%D8%AF%DB%8C%D8%A8%D9%87%D8%B4%D8%AA-%DB%B1%DB%B3%DB%B9%DB%B9-44850309-374.jpg\",\"price\":15},{\"id\":3,\"name\":\"Asp.Net Core 3.1\",\"purchased\":false,\"favorite\":false,\"description\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\",\"image\":\"https:\/\/toplearn.com\/img\/course\/img-course-%D8%B3%D9%87-%D8%B4%D9%86%D8%A8%D9%87-%DB%B6-%D8%B4%D9%87%D8%B1%DB%8C%D9%88%D8%B1-%DB%B1%DB%B3%DB%B9%DB%B7-81531689-652.jpg\",\"price\":30},{\"id\":4,\"name\":\"Blazor\",\"purchased\":false,\"favorite\":false,\"description\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\",\"image\":\"https:\/\/toplearn.com\/img\/course\/img-course-%D8%B3%D9%87-%D8%B4%D9%86%D8%A8%D9%87-%DB%B1%DB%B9-%D9%81%D8%B1%D9%88%D8%B1%D8%AF%DB%8C%D9%86-%DB%B1%DB%B3%DB%B9%DB%B9-30506704-394.jpg\",\"price\":25},{\"id\":5,\"name\":\"React Native\",\"purchased\":false,\"favorite\":false,\"description\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\",\"image\":\"https:\/\/toplearn.com\/img\/course\/img-course-%DB%8C%DA%A9-%D8%B4%D9%86%D8%A8%D9%87-%DB%B7-%D8%A7%D8%B1%D8%AF%DB%8C%D8%A8%D9%87%D8%B4%D8%AA-%DB%B1%DB%B3%DB%B9%DB%B9-68899166-822.jpg\",\"price\":30},{\"id\":6,\"name\":\"MongoDB\",\"purchased\":false,\"favorite\":false,\"description\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\",\"image\":\"https:\/\/toplearn.com\/img\/course\/img-course-%D8%B3%D9%87-%D8%B4%D9%86%D8%A8%D9%87-%DB%B1%DB%B4-%D8%A2%D8%A8%D8%A7%D9%86-%DB%B1%DB%B3%DB%B9%DB%B8-13338027-658.jpg\",\"price\":10},{\"id\":7,\"name\":\"Django\",\"purchased\":false,\"favorite\":false,\"description\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\",\"image\":\"https:\/\/toplearn.com\/img\/course\/img-course-%D8%AC%D9%85%D8%B9%D9%87-%DB%B5-%D8%A7%D8%B1%D8%AF%DB%8C%D8%A8%D9%87%D8%B4%D8%AA-%DB%B1%DB%B3%DB%B9%DB%B9-98167350-546.jpg\",\"price\":20},{\"id\":8,\"name\":\"React\",\"purchased\":false,\"favorite\":false,\"description\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\",\"image\":\"https:\/\/toplearn.com\/img\/course\/img-course-%D8%B3%D9%87-%D8%B4%D9%86%D8%A8%D9%87-%DB%B3%DB%B0-%D8%A7%D8%B1%D8%AF%DB%8C%D8%A8%D9%87%D8%B4%D8%AA-%DB%B1%DB%B3%DB%B9%DB%B9-81329230-971.jpg\",\"price\":10},{\"id\":9,\"name\":\"Photoshop\",\"purchased\":false,\"favorite\":false,\"description\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\",\"image\":\"https:\/\/toplearn.com\/img\/course\/img-course-%D8%AC%D9%85%D8%B9%D9%87-%DB%B2%DB%B6-%D8%A7%D8%B1%D8%AF%DB%8C%D8%A8%D9%87%D8%B4%D8%AA-%DB%B1%DB%B3%DB%B9%DB%B9-9705171-547.jpg\",\"price\":5},{\"id\":10,\"name\":\"React Js\",\"purchased\":false,\"favorite\":false,\"description\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\",\"image\":\"https:\/\/toplearn.com\/img\/course\/img-course-%DA%86%D9%87%D8%A7%D8%B1-%D8%B4%D9%86%D8%A8%D9%87-%DB%B2%DB%B4-%D8%A7%D8%B1%D8%AF%DB%8C%D8%A8%D9%87%D8%B4%D8%AA-%DB%B1%DB%B3%DB%B9%DB%B9-54646682-1015.jpg\",\"price\":10},{\"id\":11,\"name\":\"Python\",\"purchased\":false,\"favorite\":false,\"description\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\",\"image\":\"https:\/\/toplearn.com\/img\/course\/img-course-%D8%AF%D9%88-%D8%B4%D9%86%D8%A8%D9%87-%DB%B2%DB%B4-%D8%AA%DB%8C%D8%B1-%DB%B1%DB%B3%DB%B9%DB%B8-7255494-674.jpg\",\"price\":25},{\"id\":12,\"name\":\"Retrofit\",\"purchased\":false,\"favorite\":false,\"description\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\",\"image\":\"https:\/\/toplearn.com\/img\/course\/img-course-%D8%B3%D9%87-%D8%B4%D9%86%D8%A8%D9%87-%DB%B2%DB%B3-%D8%A7%D8%B1%D8%AF%DB%8C%D8%A8%D9%87%D8%B4%D8%AA-%DB%B1%DB%B3%DB%B9%DB%B9-13876823-486.jpg\",\"price\":20},{\"id\":13,\"name\":\"Ruby\",\"purchased\":false,\"favorite\":false,\"description\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\",\"image\":\"https:\/\/toplearn.com\/img\/course\/img-course-%DB%8C%DA%A9-%D8%B4%D9%86%D8%A8%D9%87-%DB%B7-%D8%A7%D8%B1%D8%AF%DB%8C%D8%A8%D9%87%D8%B4%D8%AA-%DB%B1%DB%B3%DB%B9%DB%B9-13929719-1194.jpg\",\"price\":15},{\"id\":14,\"name\":\"PHP\",\"purchased\":false,\"favorite\":false,\"description\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\",\"image\":\"https:\/\/toplearn.com\/img\/course\/img-course-%DB%8C%DA%A9-%D8%B4%D9%86%D8%A8%D9%87-%DB%B2%DB%B4-%D9%81%D8%B1%D9%88%D8%B1%D8%AF%DB%8C%D9%86-%DB%B1%DB%B3%DB%B9%DB%B9-67391120-1191.jpg\",\"price\":30},{\"id\":15,\"name\":\"Unity\",\"purchased\":false,\"favorite\":false,\"description\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\",\"image\":\"https:\/\/toplearn.com\/img\/course\/img-course-%D8%AF%D9%88-%D8%B4%D9%86%D8%A8%D9%87-%DB%B1%DB%B8-%D9%81%D8%B1%D9%88%D8%B1%D8%AF%DB%8C%D9%86-%DB%B1%DB%B3%DB%B9%DB%B9-9713329-894.jpg\",\"price\":25},{\"id\":16,\"name\":\"PHP Advanced\",\"purchased\":false,\"favorite\":false,\"description\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\",\"image\":\"https:\/\/toplearn.com\/img\/course\/img-course-%D8%AC%D9%85%D8%B9%D9%87-%DB%B5-%D8%A7%D8%B1%D8%AF%DB%8C%D8%A8%D9%87%D8%B4%D8%AA-%DB%B1%DB%B3%DB%B9%DB%B9-34946869-574.jpg\",\"price\":30},{\"id\":17,\"name\":\"Flutter\",\"purchased\":false,\"favorite\":false,\"description\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\",\"image\":\"https:\/\/toplearn.com\/img\/course\/img-course-%D8%B3%D9%87-%D8%B4%D9%86%D8%A8%D9%87-%DB%B1%DB%B9-%D9%81%D8%B1%D9%88%D8%B1%D8%AF%DB%8C%D9%86-%DB%B1%DB%B3%DB%B9%DB%B9-53698530-879.jpg\",\"price\":40},{\"id\":18,\"name\":\"Xamarin Forms\",\"purchased\":false,\"favorite\":false,\"description\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\",\"image\":\"https:\/\/toplearn.com\/img\/course\/img-course-%D8%AF%D9%88-%D8%B4%D9%86%D8%A8%D9%87-%DB%B8-%D8%A7%D8%B1%D8%AF%DB%8C%D8%A8%D9%87%D8%B4%D8%AA-%DB%B1%DB%B3%DB%B9%DB%B9-21324926-1105.jpg\",\"price\":20},{\"id\":19,\"name\":\"Laravel\",\"purchased\":false,\"favorite\":false,\"description\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\",\"image\":\"https:\/\/toplearn.com\/img\/course\/img-course-%D8%B4%D9%86%D8%A8%D9%87-%DB%B1%DB%B5-%D8%AA%DB%8C%D8%B1-%DB%B1%DB%B3%DB%B9%DB%B8-20634204-684.jpg\",\"price\":10},{\"id\":20,\"name\":\"Excel\",\"purchased\":false,\"favorite\":false,\"description\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\",\"image\":\"https:\/\/toplearn.com\/img\/course\/img-course-%D8%AF%D9%88-%D8%B4%D9%86%D8%A8%D9%87-%DB%B1%DB%B8-%D9%81%D8%B1%D9%88%D8%B1%D8%AF%DB%8C%D9%86-%DB%B1%DB%B3%DB%B9%DB%B9-75929624-1139.jpg\",\"price\":5},{\"id\":21,\"name\":\"CCNA\",\"purchased\":false,\"favorite\":false,\"description\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\",\"image\":\"https:\/\/toplearn.com\/img\/course\/img-course-%DB%8C%DA%A9-%D8%B4%D9%86%D8%A8%D9%87-%DB%B3%DB%B1-%D9%81%D8%B1%D9%88%D8%B1%D8%AF%DB%8C%D9%86-%DB%B1%DB%B3%DB%B9%DB%B9-88371654-1261.jpg\",\"price\":10},{\"id\":22,\"name\":\"Security & HACK\",\"purchased\":false,\"favorite\":false,\"description\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\",\"image\":\"https:\/\/toplearn.com\/img\/course\/img-course-%DA%86%D9%87%D8%A7%D8%B1-%D8%B4%D9%86%D8%A8%D9%87-%DB%B2%DB%B0-%D9%81%D8%B1%D9%88%D8%B1%D8%AF%DB%8C%D9%86-%DB%B1%DB%B3%DB%B9%DB%B9-85867925-518.png\",\"price\":25}]";
    List convertedData = convert.jsonDecode(productsData);
    var currentData = convertedData.skip(skip).take(10).toList();
    for (int i = 0; i < currentData.length; i++) {
      var current = currentData[i];
      products.add(new Product(
          id: current['id'],
          name: current['name'],
          favorite: current['favorite'],
          purchased: current['purchased'],
          image: current['image'],
          price: current['price'],
          description: current['description']));
    }
    return products;
  }
}
