import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  String text;
  final bool isRequired;
  final String placeHolder;
  double borderWidth = 2;
  CustomInput(this.text, this.isRequired, this.placeHolder);
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
          onSaved: (value) {
            text = value;
          },
          validator: (String value) {
            String validateText = '';
            if (isRequired && value.trim().isEmpty) {
              validateText = "Please fill this field";
            }
            return validateText;
          },
          textInputAction: TextInputAction.go,
          style: TextStyle(fontSize: 13.0, fontFamily: 'vazir'),
          decoration: new InputDecoration(
              errorStyle: TextStyle(color: accentColor2),
              labelText: placeHolder,
              border: outlineInputBorder,
              focusedErrorBorder: outlineInputBorder,
              errorBorder: outlineInputBorder,
              focusedBorder: outlineInputBorder,
              enabledBorder: outlineInputBorder)),
    );
  }
}
