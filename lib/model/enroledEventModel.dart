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

class EnrolledEventModel {
  final String id;
  final String title;
  final String description;
  final String community;
  final String imageUrl;
  final String date;
  final String status;
  final Creator creator;
  final List<Participant> participants;

  EnrolledEventModel({
    required this.id,
    required this.title,
    required this.description,
    required this.community,
    required this.imageUrl,
    required this.date,
    required this.status,
    required this.creator,
    required this.participants,
  });

  factory EnrolledEventModel.fromJson(Map<String, dynamic> json) {
    var participantsFromJson = json['participants'] as List;
    List<Participant> participantsList = participantsFromJson
        .map((participantJson) => Participant.fromJson(participantJson))
        .toList();

    return EnrolledEventModel(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      community: json['community'],
      imageUrl: json['imageUrl'],
      date: json['date'],
      status: json['status'],
      creator: Creator.fromJson(json['creator']),
      participants: participantsList,
    );
  }
}
