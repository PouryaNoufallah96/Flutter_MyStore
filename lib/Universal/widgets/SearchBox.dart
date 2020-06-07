import 'package:flutter/material.dart';
import 'package:mystore_project/search/search/index.dart';
import 'package:mystore_project/search/search/search_bloc.dart';

class SearchBox extends StatelessWidget {
  final SearchBloc bloc;
  SearchBox(this.bloc);
  var controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var grey = Colors.grey[800];
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 1.0),
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
      decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: grey),
          boxShadow: [BoxShadow(color: grey, offset: Offset(1.0, 1.0))],
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(27.0))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(Icons.search),
          Expanded(
            child: Container(
              height: 50.0,
              child: TextField(
                controller: controller,
                onSubmitted: onHandle,
                textInputAction: TextInputAction.go,
                style: TextStyle(fontSize: 14.0),
                decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(fontSize: 14.0),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: new BorderSide(
                            color: Theme.of(context).primaryColor)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: new BorderSide(
                            color: Theme.of(context).primaryColor))),
              ),
            ),
          )
        ],
      ),
    );
  }

  void onHandle(String text) {
    bloc.add(InitSearchEvent(text));
  }
}
