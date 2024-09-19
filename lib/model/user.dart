import 'package:intl/intl.dart';

class User {
  String username;
  String email;
  String imageUrl;
  // FacultyDetails facultyDetails;
  List<dynamic> posts;
  List<dynamic> communitiesCreated;
  List<CommunitiesJoined> communitiesJoined;
  List<dynamic> events;

  User({
    required this.username,
    required this.email,
    required this.imageUrl,
    required this.posts,
    required this.communitiesCreated,
    required this.communitiesJoined,
    required this.events,
  });
}

class CommunitiesJoined {
  Creator creator;
  String id;
  String name;
  String description;
  List<Member> members;
  String status;
  // String facultyId;
  List<Post> posts;
  String createdAt;
  int v;
  String? approvedFaculty;
  String communitiesJoinedId;
  String? imageUrl;

  CommunitiesJoined({
    required this.creator,
    required this.id,
    required this.name,
    required this.description,
    required this.members,
    required this.status,
    // required this.facultyId,
    required this.posts,
    required this.createdAt,
    required this.v,
    this.approvedFaculty,
    required this.communitiesJoinedId,
    this.imageUrl,
  });
  static List<CommunitiesJoined> MapToJson(List<dynamic> data) {
    List<CommunitiesJoined> data1 = [];
    if (data.isEmpty) return [];
    data.forEach((d) {
      // print(d);
      data1.add(CommunitiesJoined(
          creator: Creator(
              userId: d['creator']['userId'],
              username: d['creator']['username']),
          id: d['_id'],
          name: d['name'],
          description: d['description'],
          members: Member.maptoJson(d['members']),
          status: d['status'],
          posts: Post.maptoJson(d['posts']),
          createdAt: d['createdAt'],
          v: d['__v'],
          communitiesJoinedId: d['id']));
    });
    return data1;
  }
}

class Creator {
  String userId;
  String username;

  Creator({
    required this.userId,
    required this.username,
  });
}

class Member {
  String userId;
  String username;
  String id;
  String memberId;

  Member({
    required this.userId,
    required this.username,
    required this.id,
    required this.memberId,
  });

  static List<Member> maptoJson(List<dynamic> data) {
    List<Member> data1 = [];
    if (data.isEmpty) return data1;
    data.forEach((d) {
      data1.add(Member(
          userId: d['userId'],
          username: d['username'],
          id: d['id'],
          memberId: d['_id']));
    });
    return data1;
  }
}

class Post {
  Author author;
  String content;
  List<dynamic> tags;
  String imageUrl;
  String id;
  DateTime createdAt;
  String postId;

  Post({
    required this.author,
    required this.content,
    required this.tags,
    required this.imageUrl,
    required this.id,
    required this.createdAt,
    required this.postId,
  });
  static List<Post> maptoJson(List<dynamic> data) {
    List<Post> data1 = [];
    if (data.isEmpty) return data1;
    data.forEach((d) {
      data1.add(Post(
          author:
              Author(id: d['author']['id'], username: d['author']['username']),
          content: d['content'],
          tags: d['tags'],
          imageUrl: d['imageUrl'],
          id: d['id'],
          createdAt: DateFormat('yyyy-MM-ddThh:mm:ss').parse(d['createdAt']),
          postId: d['id']));
    });
    return data1;
  }
}

class Author {
  String id;
  String username;

  Author({
    required this.id,
    required this.username,
  });
}

class FacultyDetails {
  String department;
  String subject;
  int experience;
  String gender;

  FacultyDetails({
    required this.department,
    required this.subject,
    required this.experience,
    required this.gender,
  });
}
