class Faculty {
  String? sId;
  String? username;
  String? email;
  String? password;
  int? iV;
  String? imageUrl;
  String? department;
  String? subject;
  int? experience;
  String? gender;

  Faculty(
      {this.sId,
      this.username,
      this.email,
      this.password,
      this.iV,
      this.imageUrl,
      this.department,
      this.subject,
      this.experience,
      this.gender});

  Faculty.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    iV = json['__v'];
    imageUrl = json['imageUrl'];
    department = json['department'];
    subject = json['subject'];
    experience = json['experience'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['__v'] = this.iV;
    data['imageUrl'] = this.imageUrl;
    data['department'] = this.department;
    data['subject'] = this.subject;
    data['experience'] = this.experience;
    data['gender'] = this.gender;
    return data;
  }
}
