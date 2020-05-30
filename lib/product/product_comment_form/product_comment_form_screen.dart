import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mystore_project/Universal/widgets/custom_input.dart';
import 'package:mystore_project/product/product_comment_form/index.dart';

import '../../Universal/widgets/customLoading.dart';

class ProductCommentFormScreen extends StatefulWidget {
  @override
  ProductCommentFormScreenState createState() {
    return ProductCommentFormScreenState();
  }
}

class ProductCommentFormScreenState extends State<ProductCommentFormScreen> {
  ProductCommentFormScreenState();

  ProductCommentFormBloc bloc;
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String mail = '';
  String msg = '';
  @override
  void initState() {
    bloc = ProductCommentFormBloc(msg, name, mail);
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 35),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.black12),
            margin: EdgeInsets.only(top: 20, bottom: 10, left: 10, right: 10),
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(child: CustomInput(mail, true, "Email")),
                      Expanded(child: CustomInput(name, true, "UserName"))
                    ],
                  ),
                  CustomInput(msg, true, "Comment"),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: MaterialButton(
                      color: Theme.of(context).accentColor,
                      child: Text("Submit"),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          bloc.add(SendProductCommentFormEvent());
                        }
                      },
                    ),
                  ),
                ],
              ),
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
