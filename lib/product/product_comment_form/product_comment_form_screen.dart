import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mystore_project/Universal/widgets/custom_input.dart';
import 'package:mystore_project/config/config/config_bloc.dart';
import 'package:mystore_project/models/comment.dart';
import 'package:mystore_project/product/product_comment_form/index.dart';

import '../../Universal/widgets/customLoading.dart';

class ProductCommentFormScreen extends StatefulWidget {
  ProductCommentFormScreen();
  @override
  ProductCommentFormScreenState createState() {
    return ProductCommentFormScreenState();
  }
}

class ProductCommentFormScreenState extends State<ProductCommentFormScreen> {
  ProductCommentFormScreenState();

  ProductCommentFormBloc bloc;
  final _formKey = GlobalKey<FormState>();
  var commentController = TextEditingController();
  @override
  void initState() {
    bloc = ProductCommentFormBloc();
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text(
            "Enter Your Comment",
            style: Theme.of(context).textTheme.headline6,
          ),
          CustomInput(commentController, true, ConfigBloc().username),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            child: MaterialButton(
              color: Theme.of(context).accentColor,
              child: Text("Submit"),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  var comment = new Comment(
                      id: 0,
                      author: ConfigBloc().username,
                      image:
                          "https://lh3.googleusercontent.com/-hdBoSkVmD_Y/AAAAAAAAAAI/AAAAAAAAAAA/AMZuuclOcK2iS_dwGuwHbbjE1ahTi49uKQ/photo.jpg?sz=46",
                      comment: commentController.text.toString());
                  bloc.add(SendProductCommentFormEvent([], comment));
                }
              },
            ),
          ),
          BlocBuilder<ProductCommentFormBloc, ProductCommentFormState>(
              bloc: bloc,
              builder: (
                BuildContext context,
                ProductCommentFormState currentState,
              ) {
                if (currentState is SendingProductCommentFormState) {
                  return CustomLoading();
                } else if (currentState is SuccessProductCommentFormState) {
                  return Text("Success");
                } else if (currentState is ErrorProductCommentFormState) {
                  return Text("Error");
                } else
                  return Container();
              }),
        ],
      ),
    );
  }
}
