import 'package:arcane/arcane.dart';

class MyRecipesScreen extends StatefulWidget {
  const MyRecipesScreen({super.key});

  @override
  State<MyRecipesScreen> createState() => _MyRecipesScreenState();
}

class _MyRecipesScreenState extends State<MyRecipesScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(child: PrimaryButton(child: Text("Go back"), onPressed: () => Arcane.pop(context),));
  }
}