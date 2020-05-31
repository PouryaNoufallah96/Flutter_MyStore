import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  TextEditingController controller;
  final bool isRequired;
  final String placeHolder;
  double borderWidth = 2;
  CustomInput(this.controller, this.isRequired, this.placeHolder);
  @override
  Widget build(BuildContext context) {
    var borderRadius2 = BorderRadius.all(Radius.circular(10));
    var accentColor2 = Theme.of(context).accentColor;
    var outlineInputBorder = OutlineInputBorder(
      borderRadius: borderRadius2,
      borderSide: BorderSide(color: accentColor2, width: borderWidth),
    );

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: TextFormField(
          controller: controller,
          validator: (String value) {
            if (isRequired && value.trim().isEmpty) {
              return "Please fill this field";
            }
          },
          textInputAction: TextInputAction.go,
          style: TextStyle(fontSize: 12.0),
          maxLines: null,
          keyboardType: TextInputType.text,
          decoration: new InputDecoration(
              errorStyle: TextStyle(color: accentColor2),
              labelText: placeHolder,
              border: outlineInputBorder,
              labelStyle: TextStyle(color: accentColor2),
              focusedErrorBorder: outlineInputBorder,
              errorBorder: outlineInputBorder,
              focusedBorder: outlineInputBorder,
              enabledBorder: outlineInputBorder)),
    );
  }
}
