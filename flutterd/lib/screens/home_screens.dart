import 'package:flutter/material.dart';
import 'package:flutterd/state/post_state.dart';
import 'package:provider/provider.dart';

class HomeScreens extends StatefulWidget {
  static const routeName = '/home-screens';

  @override
  _HomeScreensState createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  bool _init = true;
  bool _isLoding = false;

  @override
  void didChangeDependencies() async {
    if (_init) {
      _isLoding =
          await Provider.of<PostState>(context, listen: false).getPostData();
      setState(() {});
    }
    _init = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final posts = Provider.of<PostState>(context).post;
    if (_isLoding == false || posts == null)
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    else
      return Scaffold(
        appBar: AppBar(
          title: Text("Welcome to Code"),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (ctx, i) {
            return Card(
              child: Text(posts[i].title),
            );
          },
        ),
      );
  }
}
