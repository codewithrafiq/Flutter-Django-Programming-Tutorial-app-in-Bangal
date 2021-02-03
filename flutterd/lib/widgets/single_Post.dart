import 'package:flutter/material.dart';
import 'package:flutterd/model/post_model.dart';
import 'package:flutterd/widgets/single_comments.dart';

class SinglePost extends StatefulWidget {
  final Post post;
  SinglePost(this.post);

  @override
  _SinglePostState createState() => _SinglePostState();
}

class _SinglePostState extends State<SinglePost> {
  bool _showComments = false;
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
                  widget.post.title,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(widget.post.category.title),
                  ),
                ),
              ],
            ),
            if (widget.post.code.length != 0)
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
                          widget.post.code,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            widget.post.content.length > 100
                ? Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.post.content.substring(0, 100)}...",
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
                      "${widget.post.content}",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
            Divider(),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite,
                      color: Theme.of(context).accentColor,
                    ),
                    label: Text(
                      "Like()",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  FlatButton.icon(
                    onPressed: () {
                      setState(() {
                        _showComments = !_showComments;
                      });
                    },
                    icon: Icon(
                      Icons.comment,
                      color: Theme.of(context).accentColor,
                    ),
                    label: Text(
                      "Comment()",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (_showComments)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Comment...",
                      ),
                    ),
                  ),
                  Container(
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: widget.post.comment
                            .map(
                              (e) => SingleComment(e),
                            )
                            .toList(),
                      ),
                    ),
                  )
                ],
              ),
          ],
        ),
      ),
    );
  }
}
