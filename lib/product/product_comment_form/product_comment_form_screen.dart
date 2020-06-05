import 'package:flutter/material.dart';
import 'package:mystore_project/Universal/widgets/custom_input.dart';
import 'package:mystore_project/config/config/config_bloc.dart';
import 'package:mystore_project/models/comment.dart';
import 'package:mystore_project/product/product_comment_form/index.dart';
import '../../Universal/widgets/customLoading.dart';

class ProductCommentFormScreen extends StatefulWidget {
  final ProductCommentFormState currentState;
  final ProductCommentFormBloc bloc;

  ProductCommentFormScreen(this.currentState, this.bloc);
  @override
  ProductCommentFormScreenState createState() {
    return ProductCommentFormScreenState();
  }
}

class ProductCommentFormScreenState extends State<ProductCommentFormScreen> {
  ProductCommentFormScreenState();

  final _formKey = GlobalKey<FormState>();
  var commentController = TextEditingController();

  Widget commentState() {
    if (widget.currentState is SendingProductCommentFormState) {
      return CustomLoading();
    } else if (widget.currentState is SuccessProductCommentFormState) {
      return Text(
        "Your comment have sent successfully",
        style: TextStyle(color: Colors.green),
      );
    } else if (widget.currentState is ErrorProductCommentFormState) {
      return Text(
        "Error!",
        style: TextStyle(color: Colors.red),
      );
    } else
      return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          CustomInput(commentController, true, ConfigBloc().username),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            child: MaterialButton(
              color: Theme.of(context).accentColor,
              child: Text(
                "Send",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  var comment = new Comment(
                      id: 0,
                      author: ConfigBloc().username,
                      image:
                          "https://lh3.googleusercontent.com/-hdBoSkVmD_Y/AAAAAAAAAAI/AAAAAAAAAAA/AMZuuclOcK2iS_dwGuwHbbjE1ahTi49uKQ/photo.jpg?sz=46",
                      comment: commentController.text.toString());
                  widget.bloc.add(SendProductCommentFormEvent(comment));
                  commentController.text = "";
                }
              },
            ),
          ),
          commentState(),
        ],
      ),
    );
  }
}
