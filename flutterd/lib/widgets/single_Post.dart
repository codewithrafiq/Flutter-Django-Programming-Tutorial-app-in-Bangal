import 'package:flutter/material.dart';
import 'package:flutterd/model/post_model.dart';

class SinglePost extends StatelessWidget {
  final Post post;
  SinglePost(this.post);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  post.title,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(post.category.title),
                  ),
                ),
              ],
            ),
            if (post.code.length != 0)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Code : ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Card(
                      color: Theme.of(context).primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          post.code,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            post.content.length > 100
                ? Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${post.content.substring(0, 100)}...",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "Read More",
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(
                    child: Text(
                      "${post.content}",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
