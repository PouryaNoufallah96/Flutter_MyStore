import 'package:equatable/equatable.dart';
import 'package:mystore_project/models/comment.dart';

abstract class ProductCommentState extends Equatable {
  List<Comment> mylist = new List();

  ProductCommentState(this.mylist);

  ProductCommentState.more(List<Comment> mylist2) {
    mylist.addAll(mylist2);
  }
}

/// UnInitialized
class UnProductCommentState extends ProductCommentState {
  UnProductCommentState() : super(null);

  @override
  String toString() => 'UnProductCommentState';

  @override
  List<Object> get props => [];
}

class NoProductCommentState extends ProductCommentState {
  NoProductCommentState() : super(null);

  @override
  String toString() => 'NoProductCommentState';

  @override
  List<Object> get props => [];
}

/// Initialized
class InProductCommentState extends ProductCommentState {
  List<Comment> comments;

  InProductCommentState(List<Comment> comments2) : super.more(comments2) {
    this.comments = comments2;
  }

  @override
  List<Object> get props => [mylist];
}

class ErrorProductCommentState extends ProductCommentState {
  final String errorMessage;

  ErrorProductCommentState(this.errorMessage) : super(null);

  @override
  String toString() => 'ErrorProductCommentState';

  @override
  List<Object> get props => [errorMessage];
}
