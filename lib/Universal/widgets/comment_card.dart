import 'package:flutter/material.dart';
import 'package:mystore_project/models/comment.dart';

class CommentCard extends StatelessWidget {
  final Comment comment;
  CommentCard(this.comment);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 5.0),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 5.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(comment.image),
                      backgroundColor: Theme.of(context).accentColor,
                      foregroundColor: Colors.white,
                    ),
                    width: 42.0,
                    height: 42.0,
                    padding: const EdgeInsets.all(1.5),
                    decoration: new BoxDecoration(
                        color: Colors.black12, shape: BoxShape.circle),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    comment.author,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
              Text(
                comment.comment,
                softWrap: true,
                style: TextStyle(fontSize: 11),
              ),
            ]),
      ),
    );
  }
}
