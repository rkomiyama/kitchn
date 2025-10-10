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
                  FutureBuilder<List<Recipe>?>(
                    future: loadedOnce,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                        RecipeCache.recipes = snapshot.data;
                        return Column(
                          children: RecipeCache.recipes!.map((recipe) => BasicCard(
                            thumbHash: recipe.imageHash,
                            spanned: true,
                            leading: CardImage(
                              image: Image.network(
                                recipe.image,
                                fit: BoxFit.contain,
                                height: 150,
                                width: 150,
                                errorBuilder: (_, __, ___) => const SizedBox(width: 150, height: 150),
                              ),
                            ),
                            title: SizedBox(
                              width: 500,
                              child: OverflowMarquee(child: Text(recipe.title)),
                            ),
                            onPressed: () => Arcane.push(context, RecipeMainScreen(recipe: recipe)),
                          ).withMargin(all: 8)).toList(),
                        );
                      } else {
                        return const Center(child: Text('No data...'));
                      }
                    },
                  )
                ]
            )
        )
    );
  }
}