import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kitchn/auth/secrets.dart';

import '../models/recipe.dart';

Future<List<Recipe>> getRandomRecipes() async {
  Uri requestUrl = Uri.https(
      'api.spoonacular.com',
      'recipes/random',
      {
        "apiKey": spoonacularSecretKey,
        "number": "10"
      }
  );
  List<Recipe> recipes = [];
  http.Response response = await http.get(requestUrl);
  final recipesList = jsonDecode(response.body);
  recipesList['recipes'].forEach((recipe) => {
    recipes.add(Recipe.fromJson(recipe))
  });

  return recipes;
}