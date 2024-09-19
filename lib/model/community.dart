class Communites {
  Creator? creator;
  String? sId;
  String? name;
  String? description;
  String? status;
  String? imageUrl;
  String? id;

  Communites(
      {this.creator,
      this.sId,
      this.name,
      this.description,
      this.status,
      this.imageUrl,
      this.id});

  Communites.fromJson(Map<String, dynamic> json) {
    creator =
        json['creator'] != null ? new Creator.fromJson(json['creator']) : null;
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    status = json['status'];
    imageUrl = json['imageUrl'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.creator != null) {
      data['creator'] = this.creator!.toJson();
    }
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['status'] = this.status;
    data['imageUrl'] = this.imageUrl;
    data['id'] = this.id;
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
