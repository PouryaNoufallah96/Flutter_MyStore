import 'package:flutter/material.dart';
import 'package:mystore_project/config/config/index.dart';

class MyScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget tabBar;
  final Widget drawer;

  const MyScaffold(
      {Key key,
      @required this.body,
      @required this.title,
      this.tabBar,
      this.drawer})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      color: ConfigBloc().darkModeOn ? Colors.grey[800] : Colors.white,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          drawer: drawer != null ? drawer : null,
          appBar: AppBar(
            title: Text(title),
            centerTitle: true,
            bottom: tabBar != null ? tabBar : null,
          ),
          body: body,
        ),
      ),
    );
  }
}
