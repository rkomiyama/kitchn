import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:html2md/html2md.dart' as html2md;
import 'package:kitchn/auth/secrets.dart';

import '../gen/artifacts.gen.dart';
import '../models/recipe.dart';

Future<List<Recipe>?> getRandomRecipes() async {
  Uri requestUrl = Uri.https(
      'api.spoonacular.com',
      'recipes/random',
      {
        "apiKey": spoonacularSecretKey,
        "number": "20"
      }
  );
  http.Response response = await http.get(requestUrl);
  final recipesList = await jsonDecode(response.body);
  final recipesData = recipesList['recipes'];
  final futures = recipesData?.map<Future<Recipe>>((recipe) async {
    try {
      recipe['summary'] = html2md.convert(recipe['summary']);
      recipe['imageHash'] = await Recipe.getImageHash(recipe['image']);
      return $Recipe.fromMap(recipe);
    } catch (e) {
      // Still return recipe data anyways
      recipe['imageHash'] = 'H3IFHI4ri5RQpWdCen0rUPLtCQ';
      return $Recipe.fromMap(recipe);
    }
  }).toList();
  return Future.wait(futures);
}