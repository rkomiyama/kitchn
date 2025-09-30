import 'package:arcane/arcane.dart';

import '../widgets/navbar.dart';

class CookingSessionScreen extends StatefulWidget {
  const CookingSessionScreen({super.key});

  @override
  State<CookingSessionScreen> createState() => _CookingSessionScreenState();
}

class _CookingSessionScreenState extends State<CookingSessionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        headers: [NavBar()],
        child: Center(child: Text("Cooking session!"))
    );
  }
}