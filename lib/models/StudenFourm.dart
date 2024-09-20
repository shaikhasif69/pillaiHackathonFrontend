class StudentFourm {
  String? sId;
  String? group;
  User? user;
  String? content;
  int? upvotes;
  int? downvotes;
  String? createdAt;
  String? updatedAt;
  int? iV;

  StudentFourm(
      {this.sId,
      this.group,
      this.user,
      this.content,
      this.upvotes,
      this.downvotes,
      this.createdAt,
      this.updatedAt,
      this.iV});

  StudentFourm.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    group = json['group'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    content = json['content'];
    upvotes = json['upvotes'];
    downvotes = json['downvotes'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['group'] = this.group;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['content'] = this.content;
    data['upvotes'] = this.upvotes;
    data['downvotes'] = this.downvotes;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class User {
  String? sId;
  String? username;
  String? email;

  User({this.sId, this.username, this.email});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    username = json['username'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['username'] = this.username;
    data['email'] = this.email;
    return data;
  }
}
