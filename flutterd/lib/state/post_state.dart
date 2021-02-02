import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutterd/model/post_model.dart';
import 'package:http/http.dart' as http;

class PostState with ChangeNotifier {
  List<Post> _posts;

  Future<bool> getPostData() async {
    try {
      var token = 'f0eaa1078a8b143b6ab90a598dbc41234a94978b';
      String url = 'http://10.0.2.2:8000/api/posts/';
      http.Response response =
          await http.get(url, headers: {'Authorization': 'token $token'});
      var data = json.decode(response.body) as List;
      List<Post> temp = [];
      data.forEach((element) {
        Post post = Post.fromJson(element);
        temp.add(post);
      });
      _posts = temp;
      notifyListeners();
      return true;
    } catch (e) {
      print("error getPostData");
      print(e);
      return false;
    }
  }

  List<Post> get post {
    if (_posts != null) {
      return [..._posts];
    }
    return null;
  }
}
