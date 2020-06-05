import 'package:equatable/equatable.dart';
import 'package:mystore_project/models/product.dart';

abstract class ProductListState extends Equatable {
  List<Product> mylist = new List();
  ProductListState(this.mylist);

  ProductListState.more(List<Product> mylist2) {
    mylist.addAll(mylist2);
  }
}

/// UnInitialized
class UnProductListState extends ProductListState {
  UnProductListState() : super(null);

  @override
  String toString() => 'UnProductListState';

  @override
  List<Object> get props => [];
}

/// Initialized
class InProductListState extends ProductListState {
  List<Product> products;

  InProductListState(List<Product> products2) : super.more(products2) {
    this.products = products2;
  }

  @override
  List<Object> get props => [mylist];
}

class ErrorProductListState extends ProductListState {
  ErrorProductListState() : super(null);

  @override
  String toString() => 'ErrorProductListState';

  @override
  List<Object> get props => [];
}
