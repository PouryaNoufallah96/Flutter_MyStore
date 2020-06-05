import 'package:equatable/equatable.dart';

/// generate by https://javiercbk.github.io/json_to_dart/
class AutogeneratedProductList {
  final List<ProductListModel> results;

  AutogeneratedProductList({this.results});

  factory AutogeneratedProductList.fromJson(Map<String, dynamic> json) {
    List<ProductListModel> temp;
    if (json['results'] != null) {
      temp = <ProductListModel>[];
      json['results'].forEach((v) {
        temp.add(ProductListModel.fromJson(v as Map<String, dynamic>));
      });
    }
    return AutogeneratedProductList(results: temp);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductListModel extends Equatable {
  final int id;
  final String name;

  ProductListModel(this.id, this.name);

  @override
  List<Object> get props => [id, name];

  factory ProductListModel.fromJson(Map<String, dynamic> json) {
    return ProductListModel(json['id'] as int, json['name'] as String);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
  
}