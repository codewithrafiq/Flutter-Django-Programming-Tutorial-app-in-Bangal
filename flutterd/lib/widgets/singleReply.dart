import 'package:flutter/material.dart';
import 'package:flutterd/model/post_model.dart';

class SingleReply extends StatelessWidget {
  final Reply reply;
  SingleReply(this.reply);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "by ${reply.user.username} on ${reply.time}",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              reply.title,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
