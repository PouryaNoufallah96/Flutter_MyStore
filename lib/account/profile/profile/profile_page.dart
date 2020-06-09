import 'package:flutter/material.dart';
import 'package:mystore_project/Universal/MyScafold.dart';
import 'package:mystore_project/account/profile/profile/index.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = '/profile';

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _profileBloc = ProfileBloc();

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: "Profile",
      body: ProfileScreen(profileBloc: _profileBloc),
    );
  }
}
