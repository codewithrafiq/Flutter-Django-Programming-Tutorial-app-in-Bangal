import 'package:flutter/material.dart';
import 'package:flutterd/state/post_state.dart';
import 'package:flutterd/widgets/app_drower.dart';
import 'package:flutterd/widgets/single_Post.dart';
import 'package:flutterd/widgets/single_category.dart';
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
      Provider.of<PostState>(context, listen: false).getCategoryData();
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
    final category = Provider.of<PostState>(context).category;
    if (_isLoding == false || posts == null || category == null)
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    else
      return Scaffold(
        drawer: AddDrower(),
        appBar: AppBar(
          title: Text("Welcome to Code"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              height: 45,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: category.length,
                itemBuilder: (ctx, i) => SingleCategory(category[i]),
              ),
            ),
            Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (ctx, i) => SinglePost(posts[i]),
              ),
            ),
          ],
        ),
      );
  }
}
