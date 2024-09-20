class UserChatList {
  String? imageUrl;
  String? sId;
  String? username;
  String? email;
  String? password;
  int? iV;
  String? role;

  UserChatList(
      {this.imageUrl,
      this.sId,
      this.username,
      this.email,
      this.password,
      this.iV,
      this.role});

  UserChatList.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
    sId = json['_id'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    iV = json['__v'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    data['_id'] = this.sId;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['__v'] = this.iV;
    data['role'] = this.role;
    return data;
  }
}
