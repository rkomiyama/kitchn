import 'package:arcane/arcane.dart';

class CookingSessionScreen extends StatefulWidget {
  const CookingSessionScreen({super.key});

  @override
  State<CookingSessionScreen> createState() => _CookingSessionScreenState();
}

class _CookingSessionScreenState extends State<CookingSessionScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(child: PrimaryButton(child: Text("Go back"), onPressed: () => Arcane.pop(context),));
  }
}