import 'package:arcane/arcane.dart';
import 'package:kitchn/screens/recipe/recipe_main.dart';

import '../models/recipe.dart';
import '../services/spoonacular.dart';
import '../widgets/navbar.dart';

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
      _loadRandomRecipes();
    }
  }

  void _loadRandomRecipes() async {
    if (recipes == null || recipes != []) {
      recipes = [];
    }
    recipes = await getRandomRecipes();
    setState(() {
      recipes;
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
                        Center(child: PrimaryButton(child: Text("Refresh"), onPressed: () => _loadRandomRecipes())),
                      ]
                  ).pad(16),
                  ...?recipes?.mapList((recipe) =>
                    FutureBuilder(
                      future: recipe.getImageHash(),
                      builder: (context, snapshot) {
                        String? recipeImageHash = snapshot.data;
                        return BasicCard(
                          thumbHash: recipeImageHash,
                          spanned: true,
                          leading: CardImage(image: Image.network(
                            errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                              return SizedBox(width: 150, height: 150);
                            },
                              recipe.image,
                              fit:BoxFit.contain,
                              height: 150.0,
                              width: 150.0
                          )),
                          title: Text(recipe.title),
                          onPressed: () => Arcane.push(context, RecipeMainScreen(recipe: recipe)),
                        ).withMargin(all: 8);
                      })
                  ),
                ]
            )
        )
    );
  }
}