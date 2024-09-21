class OnGoingEventModel {
  final String id;
  final String title;
  final String description;
  final String time;
  final String location;
  final String date;
  final String imageUrl;
  final String status;
  final String createdAt;
  final Creator creator;
  final List<Participant> participants;
  final Community community;

  OnGoingEventModel({
    required this.id,
    required this.title,
    required this.description,
    required this.time,
    required this.location,
    required this.date,
    required this.imageUrl,
    required this.status,
    required this.createdAt,
    required this.creator,
    required this.participants,
    required this.community,
  });

  factory OnGoingEventModel.fromJson(Map<String, dynamic> json) {
    return OnGoingEventModel(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      time: json['time'],
      location: json['location'],
      date: json['date'],
      imageUrl: json['imageUrl'],
      status: json['status'],
      createdAt: json['createdAt'],
      creator: Creator.fromJson(json['creator']),
      participants: (json['participants'] as List)
          .map((i) => Participant.fromJson(i))
          .toList(),
      community: Community.fromJson(json['community']),
    );
  }
}

class Creator {
  final String userId;
  final String username;

  Creator({required this.userId, required this.username});

  factory Creator.fromJson(Map<String, dynamic> json) {
    return Creator(
      userId: json['userId'],
      username: json['username'],
    );
  }
}

class Participant {
  final String userId;
  final String username;
  final String id;

  Participant({
    required this.userId,
    required this.username,
    required this.id,
  });

  factory Participant.fromJson(Map<String, dynamic> json) {
    return Participant(
      userId: json['userId'],
      username: json['username'],
      id: json['_id'],
    );
  }
}

class Community {
  final String id;
  final String name;

  Community({
    required this.id,
    required this.name,
  });

  factory Community.fromJson(Map<String, dynamic> json) {
    return Community(
      id: json['_id'],
      name: json['name'],
    );
  }
}
