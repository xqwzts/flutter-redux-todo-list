import 'package:flutter/material.dart';
import 'package:todo/containers/filter_link.dart';
import 'package:todo/models.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Row(
        children: <Widget>[
          new FilterLink(
            text: 'All',
            filter: VisibilityFilter.SHOW_ALL,
          ),
          new FilterLink(
            text: 'Active',
            filter: VisibilityFilter.SHOW_ACTIVE,
          ),
          new FilterLink(
            text: 'Completed',
            filter: VisibilityFilter.SHOW_COMPLETED,
          ),
        ],
      ),
    );
  }
}
