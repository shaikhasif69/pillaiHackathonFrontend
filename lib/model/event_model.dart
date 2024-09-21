class EventModel {
  final String id;
  final String title;
  final String description;
  final String time;
  final String location;
  final String date;
  final String imageUrl;
  final String status;
  final Creator creator; // Nested Creator object
  final Community community; // Nested Community object
  final List<Participant> participants; // List of Participant objects

  EventModel({
    required this.id,
    required this.title,
    required this.description,
    required this.time,
    required this.location,
    required this.date,
    required this.imageUrl,
    required this.status,
    required this.creator,
    required this.community,
    required this.participants,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      time: json['time'] ?? '',
      location: json['location'] ?? '',
      date: json['date'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      status: json['status'] ?? '',
      creator: Creator.fromJson(json['creator']), // Nested object
      community: Community.fromJson(json['community']), // Nested object
      participants: (json['participants'] as List)
          .map((participant) => Participant.fromJson(participant))
          .toList(), // List of nested objects
    );
  }

  // Convert the object to JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'description': description,
      'time': time,
      'location': location,
      'date': date,
      'imageUrl': imageUrl,
      'status': status,
      'creator': creator.toJson(), // Call toJson on nested object
      'community': community.toJson(), // Call toJson on nested object
      'participants':
          participants.map((p) => p.toJson()).toList(), // Map list to JSON
    };
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

  // Convert the object to JSON
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'username': username,
    };
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
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
    );
  }

  // Convert the object to JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
    };
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

  // Convert the object to JSON
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'username': username,
    };
  }
}
