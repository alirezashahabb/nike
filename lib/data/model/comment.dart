class CommentModel {
  final int id;
  final String title;
  final String content;
  final String date;
  final String email;

  CommentModel(
      {required this.id,
      required this.title,
      required this.content,
      required this.date,
      required this.email});

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      date: json['date'],
      email: json['author']['email'],
    );
  }
}
