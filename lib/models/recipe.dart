class Recipe {
  final String title;
  final String imageUrl;

  const Recipe({required this.title, required this.imageUrl});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return switch(json) {
      {'title': String title, 'image': String imageUrl} => Recipe(
        title: title,
        imageUrl: imageUrl,
      ),
      _ => throw const FormatException('Failed to load recipe.'),
    };
  }
}