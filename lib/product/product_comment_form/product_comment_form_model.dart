import 'package:equatable/equatable.dart';

/// generate by https://javiercbk.github.io/json_to_dart/
class AutogeneratedProductCommentForm {
  final List<ProductCommentFormModel> results;

  AutogeneratedProductCommentForm({this.results});

  factory AutogeneratedProductCommentForm.fromJson(Map<String, dynamic> json) {
    List<ProductCommentFormModel> temp;
    if (json['results'] != null) {
      temp = <ProductCommentFormModel>[];
      json['results'].forEach((v) {
        temp.add(ProductCommentFormModel.fromJson(v as Map<String, dynamic>));
      });
    }
    return AutogeneratedProductCommentForm(results: temp);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductCommentFormModel extends Equatable {
  final int id;
  final String name;

  ProductCommentFormModel(this.id, this.name);

  @override
  List<Object> get props => [id, name];

  factory ProductCommentFormModel.fromJson(Map<String, dynamic> json) {
    return ProductCommentFormModel(json['id'] as int, json['name'] as String);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
  
}