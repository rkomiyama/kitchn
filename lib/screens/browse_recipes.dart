import 'dart:convert';

import 'package:arcane/arcane.dart';
import 'package:http/http.dart' as http;
import 'package:kitchn/auth/secrets.dart';

import '../models/recipe.dart';

var requestUrl = Uri.https(
    'api.spoonacular.com',
    'recipes/random',
    {
      "apiKey": spoonacularSecretKey,
      "number": "10"
    });
List<Recipe>? recipes;

class BrowseRecipesScreen extends StatefulWidget {
  const BrowseRecipesScreen({super.key});

  @override
  State<BrowseRecipesScreen> createState() => _BrowseRecipesScreenState();
}

class _BrowseRecipesScreenState extends State<BrowseRecipesScreen> {
  @override
  void initState() {
    super.initState();

    if (recipes == null) {
      _loadRecipes();
    }
  }

  void _loadRecipes() async {
    http.Response response = await http.get(requestUrl);
    setState(() {
      if (recipes == null || recipes != []) {
        recipes = [];
      }
      final recipesList = jsonDecode(response.body);
      recipesList['recipes'].forEach((recipe) => {
        recipes?.add(Recipe.fromJson(recipe))
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Center(child: PrimaryButton(child: Text("Go back"), onPressed: () => Arcane.pop(context))),
                    Center(child: PrimaryButton(child: Text("Refresh"), onPressed: () => _loadRecipes())),
                  ]
                ).pad(16),
                ...?recipes?.mapList((recipe) =>
                    BasicCard(
                      leading: CardImage(image: Image.network(
                          recipe.imageUrl,
                          fit:BoxFit.contain,
                          height: 150.0,
                          width: 150.0
                      )),
                      title: Text(recipe.title),
                      subtitle: Text(recipe.summary),
                    )
                ),
              ]
            )
        )
    );
  }
}