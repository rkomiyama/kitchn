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
  Widget buildMarkdown() {
    return (SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Center(child: PrimaryButton(child: Text("Go back"), onPressed: () => Arcane.pop(context))),
                  ]
              ).pad(16),
              MarkdownBlock(data: widget.recipe.summary,)
            ],
          )
        )
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(child: buildMarkdown());
}