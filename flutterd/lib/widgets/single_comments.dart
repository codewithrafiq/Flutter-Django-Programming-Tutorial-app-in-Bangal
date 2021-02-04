import 'package:flutter/material.dart';
import 'package:flutterd/model/post_model.dart';
import 'package:flutterd/state/post_state.dart';
import 'package:flutterd/widgets/singleReply.dart';
import 'package:provider/provider.dart';

class SingleComment extends StatefulWidget {
  final Comment comment;
  SingleComment(this.comment);
  @override
  _SingleCommentState createState() => _SingleCommentState();
}

class _SingleCommentState extends State<SingleComment> {
  bool _showReply = false;
  final replycontroler = TextEditingController();
  String replytext = '';
  void _addreply() {
    if (replytext.length <= 0) {
      return;
    }
    Provider.of<PostState>(context, listen: false)
        .addreply(widget.comment.id, replytext);
    replycontroler.text = '';
    replytext = '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "BY ${widget.comment.user.username} at ${widget.comment.time}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              padding: EdgeInsets.all(4),
              child: Text(
                widget.comment.title,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            FlatButton(
              onPressed: () {
                setState(() {
                  _showReply = !_showReply;
                });
              },
              child: Text("Reply(${widget.comment.reply.length})"),
            ),
            if (_showReply)
              Container(
                margin: EdgeInsets.only(left: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: TextField(
                        controller: replycontroler,
                        onChanged: (v) {
                          setState(() {
                            replytext = v;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: "Reply",
                          suffix: IconButton(
                            onPressed: replytext.length <= 0
                                ? null
                                : () {
                                    _addreply();
                                  },
                            icon: Icon(Icons.send),
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ),
                    ),
                    if (widget.comment.reply.length != 0)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: widget.comment.reply
                            .map(
                              (r) => SingleReply(r),
                            )
                            .toList(),
                      )
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
