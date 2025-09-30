import 'package:arcane/arcane.dart';
import 'package:kitchn/models/recipe.dart';

import 'package:markdown_widget/markdown_widget.dart';

class RecipeMainScreen extends StatefulWidget {
  final Recipe recipe;

  const RecipeMainScreen({super.key, required this.recipe});

  @override
  State<RecipeMainScreen> createState() => _RecipeMainScreenState();
}

class _RecipeMainScreenState extends State<RecipeMainScreen> {
  Widget buildMarkdown(BuildContext context) {
    return (SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              MarkdownBlock(data: widget.recipe.summary,)
            ],
          )
        )
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      headers: [
        AppBar(
          leading: [
            OutlineButton(
              density: ButtonDensity.icon,
              onPressed: () => Arcane.pop(context),
              child: const Icon(Icons.arrow_back_ionic),
            ),
          ],
          title: Center(child: Text("kitchn")),
        ),
      ],
      child: buildMarkdown(context)
    );
}