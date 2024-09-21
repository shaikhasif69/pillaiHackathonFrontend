// community_model.dart
class Community {
  final String id;
  final String name;
  final String description;
  final String status;
  final String facultyId;
  final List<Member> members;
  final List<Post> posts;
  final String imageUrl;

  Community({
    required this.id,
    required this.name,
    required this.description,
    required this.status,
    required this.facultyId,
    required this.members,
    required this.posts,
    this.imageUrl = '',  // Default to an empty string if null
  });

  factory Community.fromJson(Map<String, dynamic> json) {
    var membersFromJson = json['members'] as List? ?? [];
    var postsFromJson = json['posts'] as List? ?? [];

    return Community(
      id: json['_id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      status: json['status'] ?? '',
      facultyId: json['facultyId'] ?? '',
      members: membersFromJson.map((member) => Member.fromJson(member)).toList(),
      posts: postsFromJson.map((post) => Post.fromJson(post)).toList(),
      imageUrl: json['imageUrl'] ?? '',
    );
  }
}

class Member {
  final String userId;
  final String username;
  final String id;

  Member({
    required this.userId,
    required this.username,
    required this.id,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      userId: json['userId'] ?? '',
      username: json['username'] ?? '',
      id: json['_id'] ?? '',
    );
  }
}

class Post {
  final String id;
  final String title;
  final String content;
  final String imageUrl;
  final Author author;

  Post({
    required this.id,
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.author,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      author: Author.fromJson(json['author'] ?? {}),
    );
  }
}

class Author {
  final String id;
  final String username;

  Author({
    required this.id,
    required this.username,
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      id: json['id'] ?? '',
      username: json['username'] ?? '',
    );
  }
}
