import 'package:flutter/material.dart';

class CustomListTitle extends StatelessWidget {
  const CustomListTitle({Key key, @required this.title, @required this.content})
      : super(key: key);

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.caption,
          ),
          SizedBox(width: 5),
          Expanded(
              child: Text(
            content,
            style: TextStyle(fontSize: 14),
            textAlign: TextAlign.right,
          )),
        ],
      ),
    );
  }
}
