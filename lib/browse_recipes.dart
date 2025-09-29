import 'dart:convert';

import 'package:arcane/arcane.dart';
import 'package:http/http.dart' as http;
import 'package:kitchn/auth/secrets.dart';

var requestUrl = Uri.https(
    'api.spoonacular.com',
    'recipes/random',
    {
      "apiKey": spoonacularSecretKey,
      "number": "10"
    });
var recipes = [];

class BrowseRecipesScreen extends StatefulWidget {
  const BrowseRecipesScreen({super.key});

  @override
  State<BrowseRecipesScreen> createState() => _BrowseRecipesScreenState();
}

class _BrowseRecipesScreenState extends State<BrowseRecipesScreen> {
  @override
  void initState() {
    super.initState();

    _loadRecipes();
  }

  void _loadRecipes() async {
    http.Response response = await http.get(requestUrl);
    setState(() {
      final recipesList = jsonDecode(response.body);
      recipes = recipesList['recipes'];
    });
  }

  @override
  void dispose() {
    recipes = [];
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ...recipes.map((recipe) => BasicCard(
                    leading: CardImage(image: Image.network(recipe['image'])),
                    title: Text(recipe['title'])
                )),
                Center(child: PrimaryButton(child: Text("Go back"), onPressed: () => Arcane.pop(context)))
              ]
            )
        )
    );
    // return Center(child: PrimaryButton(child: Text("Go back"), onPressed: () => Arcane.pop(context),));
  }
}