class Discussion {
  bool? isGroupMessage;
  int? upvotes;
  int? downvotes;
  String? sId;
  String? roomId;
  String? userId;
  String? username;
  String? content;
  String? createdAt;
  String? imgUrl;

  Discussion(
      {this.isGroupMessage,
      this.upvotes,
      this.downvotes,
      this.sId,
      this.roomId,
      this.userId,
      this.username,
      this.content,
      this.createdAt,
      this.imgUrl});

  Discussion.fromJson(Map<String, dynamic> json) {
    isGroupMessage = json['isGroupMessage'];
    upvotes = json['upvotes'];
    downvotes = json['downvotes'];
    sId = json['_id'];
    roomId = json['roomId'];
    userId = json['userId'];
    username = json['username'];
    content = json['content'];
    createdAt = json['createdAt'];
    imgUrl = json['imgUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isGroupMessage'] = this.isGroupMessage;
    data['upvotes'] = this.upvotes;
    data['downvotes'] = this.downvotes;
    data['_id'] = this.sId;
    data['roomId'] = this.roomId;
    data['userId'] = this.userId;
    data['username'] = this.username;
    data['content'] = this.content;
    data['createdAt'] = this.createdAt;
    data['imgUrl'] = this.imgUrl;
    return data;
  }
}
