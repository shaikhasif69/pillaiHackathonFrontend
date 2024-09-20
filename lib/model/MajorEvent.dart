class MajorEvent {
  String? title;
  String? description;
  String? community;
  Creator? creator;
  String? imageUrl;
  String? status;
  String? sId;
  String? createdAt;
  int? iV;

  MajorEvent(
      {this.title,
      this.description,
      this.community,
      this.creator,
      this.imageUrl,
      this.status,
      this.sId,
      this.createdAt,
      this.iV});

  MajorEvent.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    community = json['community'];
    creator =
        json['creator'] != null ? new Creator.fromJson(json['creator']) : null;
    imageUrl = json['imageUrl'];
    status = json['status'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['community'] = this.community;
    if (this.creator != null) {
      data['creator'] = this.creator!.toJson();
    }
    data['imageUrl'] = this.imageUrl;
    data['status'] = this.status;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Creator {
  String? userId;
  String? username;

  Creator({this.userId, this.username});

  Creator.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['username'] = this.username;
    return data;
  }
}
