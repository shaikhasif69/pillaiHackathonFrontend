class ChattingModel {
  String? roomId;
  String? userId;
  String? username;
  String? imageUrl;
  bool? discussion;
  String? content;
  String? createdAt;
  String? sId;
  int? iV;

  ChattingModel(
      {this.roomId,
      this.userId,
      this.username,
      this.imageUrl,
      this.discussion,
      this.content,
      this.createdAt,
      this.sId,
      this.iV});

  ChattingModel.fromJson(Map<String, dynamic> json) {
    roomId = json['roomId'];
    userId = json['userId'];
    username = json['username'];
    imageUrl = json['imageUrl'];
    discussion = json['discussion'];
    content = json['content'];
    createdAt = json['createdAt'];
    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roomId'] = this.roomId;
    data['userId'] = this.userId;
    data['username'] = this.username;
    data['imageUrl'] = this.imageUrl;
    data['discussion'] = this.discussion;
    data['content'] = this.content;
    data['createdAt'] = this.createdAt;
    data['_id'] = this.sId;
    data['__v'] = this.iV;
    return data;
  }
}
