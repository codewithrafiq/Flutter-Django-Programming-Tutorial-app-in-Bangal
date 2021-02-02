import 'package:flutter/material.dart';
import 'package:flutterd/model/post_model.dart';

class SingleCategory extends StatelessWidget {
  final Category category;
  SingleCategory(this.category);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Card(
        color: Theme.of(context).accentColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(category.title),
        ),
      ),
    );
  }
}
