import 'package:mystore_project/account/login/login/index.dart';

class LoginRepository {
  final LoginProvider _loginProvider = LoginProvider();

  LoginRepository();

  void test(bool isError) {
    _loginProvider.test(isError);
  }
}