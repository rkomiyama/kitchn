import 'dart:convert';
import 'dart:ffi';

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
List<dynamic> recipes = [];

class BrowseRecipesScreen extends StatefulWidget {
  const BrowseRecipesScreen({super.key});

  @override
  State<BrowseRecipesScreen> createState() => _BrowseRecipesScreenState();
}

class _BrowseRecipesScreenState extends State<BrowseRecipesScreen> {
  @override
  void initState() {
    super.initState();

    if (recipes == []) {
      _loadRecipes();
    }
  }

  void _loadRecipes() async {
    http.Response response = await http.get(requestUrl);
    setState(() {
      final recipesList = jsonDecode(response.body);
      recipes = recipesList['recipes'];
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
                Center(child: PrimaryButton(child: Text("Go back"), onPressed: () => Arcane.pop(context))),
                Center(child: PrimaryButton(child: Text("Refresh"), onPressed: () => _loadRecipes())),
                ...recipes.map((recipe) =>
                    BasicCard(
                      leading: CardImage(image: Image.network(
                          recipe['image'],
                          fit:BoxFit.contain,
                          height: 150.0,
                          width: 150.0
                      )),
                      title: Text(recipe['title'])
                    )
                ),
              ]
            )
        )
    );
    // return Center(child: PrimaryButton(child: Text("Go back"), onPressed: () => Arcane.pop(context),));
  }
}