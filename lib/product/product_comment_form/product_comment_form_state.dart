import 'package:equatable/equatable.dart';

abstract class ProductCommentFormState extends Equatable {
  ProductCommentFormState();
}

class UnProductCommentFormState extends ProductCommentFormState {
  UnProductCommentFormState() : super();

  @override
  String toString() => 'UnProductCommentFormState';

  @override
  List<Object> get props => [];
}

class SendingProductCommentFormState extends ProductCommentFormState {
  SendingProductCommentFormState() : super();

  @override
  String toString() => 'SendingProductCommentFormState';

  List<Object> get props => [];
}

class SuccessProductCommentFormState extends ProductCommentFormState {
  SuccessProductCommentFormState();

  @override
  List<Object> get props => [];
}

class ErrorProductCommentFormState extends ProductCommentFormState {
  final String errorMessage;

  ErrorProductCommentFormState(int version, this.errorMessage) : super();

  @override
  String toString() => 'ErrorProductCommentFormState';

  @override
  List<Object> get props => [];
}
