import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutterd/model/post_model.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';

class PostState with ChangeNotifier {
  List<Post> _posts;
  List<Category> _category;

  LocalStorage storage = LocalStorage("usertoken");

  Future<bool> getPostData() async {
    try {
      var token = storage.getItem('token');
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

  Future<void> getCategoryData() async {
    try {
      var token = storage.getItem('token');
      String url = 'http://10.0.2.2:8000/api/categorys/';
      http.Response response = await http.get(
        url,
        headers: {'Authorization': 'token $token'},
      );
      var data = json.decode(response.body) as List;
      // print(data);
      List<Category> temp = [];
      data.forEach((element) {
        Category category = Category.fromJson(element);
        temp.add(category);
      });
      _category = temp;
      notifyListeners();
    } catch (e) {
      print("error getCategoryData");
      print(e);
    }
  }

  Future<void> addlike(int id) async {
    try {
      var token = storage.getItem('token');
      String url = 'http://10.0.2.2:8000/api/addlike/';
      http.Response response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'token $token',
        },
        body: json.encode({
          "id": id,
        }),
      );
      var data = json.decode(response.body);
      if (data['error'] == false) {
        getPostData();
      }
    } catch (e) {
      print("error addlike");
      print(e);
    }
  }

  Future<void> addcomment(int postid, String commenttext) async {
    try {
      var token = storage.getItem('token');
      String url = 'http://10.0.2.2:8000/api/addcomment/';
      http.Response response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'token $token',
        },
        body: json.encode({
          "postid": postid,
          "comment": commenttext,
        }),
      );
      var data = json.decode(response.body);
      if (data['error'] == false) {
        getPostData();
      }
    } catch (e) {
      print("error addcomment");
      print(e);
    }
  }

  Future<void> addreply(int commentid, String replytext) async {
    try {
      var token = storage.getItem('token');
      String url = 'http://10.0.2.2:8000/api/addreply/';
      http.Response response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'token $token',
        },
        body: json.encode({
          "commentid": commentid,
          "replytext": replytext,
        }),
      );
      var data = json.decode(response.body);
      // print(data);
      if (data['error'] == false) {
        getPostData();
      }
    } catch (e) {
      print("error addreply");
      print(e);
    }
  }

  Future<bool> loginNow(String username, String password) async {
    try {
      String url = 'http://10.0.2.2:8000/api/login/';
      http.Response response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode({
          'username': username,
          'password': password,
        }),
      );
      var data = json.decode(response.body) as Map;
      // print(data);
      if (data.containsKey('token')) {
        storage.setItem('token', data['token']);
        // print(storage.getItem('token'));
        return false;
      }
      return true;
    } catch (e) {
      print("error loginnow");
      print(e);
      return true;
    }
  }

  Future<bool> registerNow(String username, String password) async {
    try {
      String url = 'http://10.0.2.2:8000/api/register/';
      http.Response response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode({
          'username': username,
          'password': password,
        }),
      );
      var data = json.decode(response.body) as Map;
      // if (data['error'] = false) {
      //   return false;
      // }
      return data['error'];
    } catch (e) {
      print("error register now");
      print(e);
      return true;
    }
  }

  List<Post> get post {
    if (_posts != null) {
      return [..._posts];
    }
    return null;
  }

  List<Category> get category {
    if (_posts != null) {
      return [..._category];
    }
    return null;
  }

  Post singlePost(int id) {
    return _posts.firstWhere((element) => element.id == id);
  }

  List<Post> categoryposts(int id) {
    return [..._posts.where((element) => element.category.id == id)];
  }
}
