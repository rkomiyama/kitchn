import 'package:html2md/html2md.dart' as html2md;

class Recipe {
  final String title;
  final String imageUrl;
  final String summary;

  const Recipe({
    required this.title,
    required this.imageUrl,
    required this.summary
  });

  @override
  String toString() {
    return '''
      Recipe(
        title: $title,
        image: $imageUrl,
        summary: $summary
      )
    ''';
  }

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return switch(json) {
      {
        'title': String title,
        'image': String imageUrl,
        'summary': String summary,
      } => Recipe(
        title: title,
        imageUrl: imageUrl,
        summary: html2md.convert(summary),
      ),
      _ => throw const FormatException('Failed to load recipe.'),
    };
  }
}