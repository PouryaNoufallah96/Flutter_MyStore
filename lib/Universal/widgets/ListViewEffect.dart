import 'package:flutter/material.dart';
import 'package:mystore_project/Universal/widgets/ItemEffect.dart';
import 'package:mystore_project/Universal/widgets/ListBloc.dart';

class ListViewEffect extends StatefulWidget {
  final Duration duration;
  final List<Widget> children;
  ListViewEffect({Key key, this.duration, this.children}) : super(key: key);
  _ListViewEffect createState() => new _ListViewEffect();
}

class _ListViewEffect extends State<ListViewEffect> {
  ListBloc _listBloc;

  initState() {
    _listBloc = new ListBloc();
    super.initState();
  }

  Widget build(BuildContext context) {
    _listBloc.startAnimation(widget.children.length, widget.duration);

    return ListView.builder(
        padding: EdgeInsets.all(10),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: widget.children.length,
        itemBuilder: (context, position) {
          return new ItemEffect(
              child: widget.children[position],
              duration: widget.duration,
              position: position);
        });
  }

  @override
  void dispose() {
    _listBloc.dispose();
    super.dispose();
  }
}
