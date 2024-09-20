class StudentFourmModel {
  String? messageId;
  String? groupId;
  String? userId;
  String? username;
  String? profileImage;
  String? content;
  String? createdAt;
  int? upvotes;
  int? downvotes;

  StudentFourmModel(
      {this.messageId,
      this.groupId,
      this.userId,
      this.username,
      this.profileImage,
      this.content,
      this.createdAt,
      this.upvotes,
      this.downvotes});

  StudentFourmModel.fromJson(Map<String, dynamic> json) {
    messageId = json['messageId'];
    groupId = json['groupId'];
    userId = json['userId'];
    username = json['username'];
    profileImage = json['profileImage'];
    content = json['content'];
    createdAt = json['createdAt'];
    upvotes = json['upvotes'];
    downvotes = json['downvotes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['messageId'] = this.messageId;
    data['groupId'] = this.groupId;
    data['userId'] = this.userId;
    data['username'] = this.username;
    data['profileImage'] = this.profileImage;
    data['content'] = this.content;
    data['createdAt'] = this.createdAt;
    data['upvotes'] = this.upvotes;
    data['downvotes'] = this.downvotes;
    return data;
  }
}
