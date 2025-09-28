import 'package:arcane/arcane.dart';

class BrowseRecipesScreen extends StatefulWidget {
  const BrowseRecipesScreen({super.key});

  @override
  State<BrowseRecipesScreen> createState() => _BrowseRecipesScreenState();
}

class _BrowseRecipesScreenState extends State<BrowseRecipesScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(child: PrimaryButton(child: Text("Go back"), onPressed: () => Arcane.pop(context),));
  }
}