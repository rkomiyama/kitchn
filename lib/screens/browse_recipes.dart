import 'package:arcane/arcane.dart';
import 'package:kitchn/screens/recipe/recipe_main.dart';

import '../models/recipe.dart';
import '../services/spoonacular.dart';
import '../widgets/navbar.dart';

class BrowseRecipesScreen extends StatefulWidget {
  const BrowseRecipesScreen({super.key});

  @override
  State<BrowseRecipesScreen> createState() => _BrowseRecipesScreenState();
}

class RecipeCache {
  static List<Recipe>? recipes = [];
}

class _BrowseRecipesScreenState extends State<BrowseRecipesScreen> {
  late Future<List<Recipe>?> loadedOnce;

  @override
  void initState() {
    super.initState();

    if (RecipeCache.recipes == null || RecipeCache.recipes!.isEmpty) {
      loadedOnce = getRandomRecipes();
    } else {
      loadedOnce = Future.value(RecipeCache.recipes);
    }
  }

  Future<void> refreshRecipes() async {
    setState(() {
      loadedOnce = getRandomRecipes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        headers: [NavBar()],
        child: SingleChildScrollView(
            child: Column(
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Center(child: OutlineButton(child: Text("Refresh"), onPressed: () { refreshRecipes();})),
                      ]
                  ).pad(16),
                    FutureBuilder<List<Recipe>?>(future: loadedOnce, builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          RecipeCache.recipes = snapshot.data;
                        }
                        if (RecipeCache.recipes!.isNotEmpty) {
                          return Column(children: <Widget>[
                            ...?RecipeCache.recipes?.mapList((recipe) =>
                                BasicCard(
                                  thumbHash: recipe.imageHash,
                                  spanned: true,
                                  leading: CardImage(image: Image.network(
                                      errorBuilder: (BuildContext context,
                                          Object exception,
                                          StackTrace? stackTrace) {
                                        return SizedBox(
                                            width: 150, height: 150);
                                      },
                                      recipe.image,
                                      fit: BoxFit.contain,
                                      height: 150.0,
                                      width: 150.0
                                  )),
                                  title: Text(recipe.title),
                                  onPressed: () =>
                                      Arcane.push(context,
                                          RecipeMainScreen(recipe: recipe)),
                                ).withMargin(all: 8))
                          ]);
                        } else {
                          return Center(child: Text("No data..."));
                        }
                      } else {
                        return Center(child: Text("Loading..."));
                      }
                    })

                ]
            )
        )
    );
  }
}