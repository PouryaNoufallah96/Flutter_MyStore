import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mystore_project/Universal/widgets/customLoading.dart';
import 'package:mystore_project/account/login/login/index.dart';
import 'package:mystore_project/config/config/config_bloc.dart';
import 'package:mystore_project/config/config/config_event.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen();

  @override
  LoginScreenState createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  LoginScreenState();
  LoginBloc loginBloc;
  TextEditingController userNameConstroller = TextEditingController();
  TextEditingController passwordConstroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    loginBloc = LoginBloc();
  }

  @override
  void dispose() {
    loginBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var hintColor2 = Theme.of(context).hintColor;
    var style = TextStyle(decoration: TextDecoration.none);
    var outlineInputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(32)),
        borderSide: BorderSide(color: hintColor2, width: 2));

    Widget emailField() {
      return TextFormField(
        style: style,
        obscureText: false,
        controller: userNameConstroller,
        validator: (String value) {
          if (value.trim().isEmpty) {
            return "Please fill this field";
          }
        },
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            labelText: "Email",
            labelStyle: TextStyle(color: hintColor2),
            focusedBorder: outlineInputBorder,
            border: outlineInputBorder),
      );
    }

    Widget passwordField() {
      return TextFormField(
        controller: passwordConstroller,
        validator: (String value) {
          if (value.trim().isEmpty) {
            return "Please fill this field";
          }
        },
        style: style,
        obscureText: true,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            labelText: "Password",
            labelStyle: TextStyle(color: hintColor2),
            focusedBorder: outlineInputBorder,
            border: outlineInputBorder),
      );
    }

    Widget loginButon() {
      return Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        color: Theme.of(context).accentColor,
        child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                loginBloc.add(InitLoginEvent(userNameConstroller.text));
                BlocProvider.of<ConfigBloc>(context)
                    .add(LogEvent(userNameConstroller.text));
                userNameConstroller.clear();
                passwordConstroller.clear();
                Navigator.pop(context);
              }
            },
            child: Text(
              "Login",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            )),
      );
    }

    return Container(
      color: Theme.of(context).backgroundColor,
      child: Center(
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            children: <Widget>[
              SizedBox(height: 45.0),
              emailField(),
              SizedBox(height: 25.0),
              passwordField(),
              SizedBox(
                height: 35.0,
              ),
              loginButon(),
              SizedBox(
                height: 15.0,
              ),
              BlocBuilder<LoginBloc, LoginState>(
                  bloc: loginBloc,
                  builder: (
                    BuildContext context,
                    LoginState currentState,
                  ) {
                    if (currentState is UnLoginState) {
                      return Center(
                        child: Container(),
                      );
                    } else if (currentState is ErrorLoginState) {
                      return Text('Error');
                    } else if (currentState is InLoginState) {
                      return Container();
                    }
                    return Center(
                      child: CustomLoading(),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
