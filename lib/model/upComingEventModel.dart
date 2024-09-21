class UpcomingEvent {
  final String id;
  final Creator creator;
  final String time;
  final String title;
  final String description;
  final String community;
  final String? location;
  final String? imageUrl;
  final String status;
  final DateTime? date;
  final DateTime createdAt;
  final List<Participant> participants;

  UpcomingEvent({
    required this.id,
    required this.creator,
    required this.time,
    required this.title,
    required this.description,
    required this.community,
    this.location,
    this.imageUrl,
    required this.status,
    this.date,
    required this.createdAt,
    required this.participants,
  });

  factory UpcomingEvent.fromJson(Map<String, dynamic> json) {
    return UpcomingEvent(
      id: json['_id'] ?? '',
      creator: Creator.fromJson(json['creator']),
      time: json['time'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      community: json['community'] ?? '',
      location: json['location'],
      imageUrl: json['imageUrl'],
      status: json['status'] ?? '',
      date: json['date'] != null ? DateTime.parse(json['date']) : null,
      createdAt: DateTime.parse(json['createdAt']),
      participants: (json['participants'] as List)
          .map((participant) => Participant.fromJson(participant))
          .toList(),
    );
  }
}

class Creator {
  final String userId;
  final String username;

  Creator({
    required this.userId,
    required this.username,
  });

  factory Creator.fromJson(Map<String, dynamic> json) {
    return Creator(
      userId: json['userId'] ?? '',
      username: json['username'] ?? '',
    );
  }
}

class Participant {
  final String userId;
  final String username;

  Participant({
    required this.userId,
    required this.username,
  });

  factory Participant.fromJson(Map<String, dynamic> json) {
    return Participant(
      userId: json['userId'] ?? '',
      username: json['username'] ?? '',
    );
  }
}
