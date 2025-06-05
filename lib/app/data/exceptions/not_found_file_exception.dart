// ignore_for_file: public_member_api_docs, sort_constructors_first
class NotFoundFileException implements Exception {
  final String message;
  NotFoundFileException({
    required this.message,
  });

  @override
  String toString() => message;
}
