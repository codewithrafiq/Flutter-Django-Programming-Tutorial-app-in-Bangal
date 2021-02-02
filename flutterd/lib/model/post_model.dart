class Post {
  int id;
  String title;
  String code;
  String content;
  String date;
  Category category;
  bool like;
  int totallike;
  List<Comment> comment;

  Post(
      {this.id,
      this.title,
      this.code,
      this.content,
      this.date,
      this.category,
      this.like,
      this.totallike,
      this.comment});

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    code = json['code'];
    content = json['content'];
    date = json['date'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    like = json['like'];
    totallike = json['totallike'];
    if (json['comment'] != null) {
      comment = new List<Comment>();
      json['comment'].forEach((v) {
        comment.add(new Comment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['code'] = this.code;
    data['content'] = this.content;
    data['date'] = this.date;
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    data['like'] = this.like;
    data['totallike'] = this.totallike;
    if (this.comment != null) {
      data['comment'] = this.comment.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  int id;
  String title;

  Category({this.id, this.title});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}

class Comment {
  int id;
  String title;
  String time;
  int user;
  int post;
  List<Reply> reply;

  Comment({this.id, this.title, this.time, this.user, this.post, this.reply});

  Comment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    time = json['time'];
    user = json['user'];
    post = json['post'];
    if (json['reply'] != null) {
      reply = new List<Reply>();
      json['reply'].forEach((v) {
        reply.add(new Reply.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['time'] = this.time;
    data['user'] = this.user;
    data['post'] = this.post;
    if (this.reply != null) {
      data['reply'] = this.reply.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reply {
  int id;
  String title;
  String time;
  int user;
  int comment;

  Reply({this.id, this.title, this.time, this.user, this.comment});

  Reply.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    time = json['time'];
    user = json['user'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['time'] = this.time;
    data['user'] = this.user;
    data['comment'] = this.comment;
    return data;
  }
}
