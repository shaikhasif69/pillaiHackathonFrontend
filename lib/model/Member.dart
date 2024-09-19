class Member1 {
  String? sId;
  String? username;
  String? imageUrl;
  String? id;

  Member1({this.sId, this.username, this.imageUrl, this.id});

  Member1.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    username = json['username'];
    imageUrl = json['imageUrl'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['username'] = this.username;
    data['imageUrl'] = this.imageUrl;
    data['id'] = this.id;
    return data;
  }
}
