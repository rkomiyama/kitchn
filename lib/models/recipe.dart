import 'package:artifact/artifact.dart';
import 'package:kitchn/gen/artifacts.gen.dart';

@artifact
class Recipe {
  final String title;
  final String image;
  final String summary;

  const Recipe({
    required this.title,
    required this.image,
    required this.summary,
  });
  
  @override
  String toString() => toMap().toString();
}