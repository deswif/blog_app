class Post {
  Post({this.id, required this.title, required this.body});

  final int? id;
  final String title;
  final String body;

  @override
  String toString() {
    return 'Post(id: $id, title: $title, body: $body)';
  }
}
