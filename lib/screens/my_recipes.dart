import 'package:arcane/arcane.dart';
import 'package:arcane_auth/service/auth_service.dart';
import 'package:kitchn/screens/authenticate.dart';
import 'package:serviced/serviced.dart';

import '../widgets/navbar.dart';

class MyRecipesScreen extends StatefulWidget {
  const MyRecipesScreen({super.key});

  @override
  State<MyRecipesScreen> createState() => _MyRecipesScreenState();
}

class _MyRecipesScreenState extends State<MyRecipesScreen> {
  @override
  Widget build(BuildContext context) {
    if (!$signedIn) {
      return Authenticate();
    } else {
      return Scaffold(
        headers: [NavBar()],
        child: SingleChildScrollView(
          child: Column(children: [
            const Gap(16),
            OutlineButton(
              child: Text("Sign out"),
              onPressed: () => svc<AuthService>().signOut(context),
            ),
            const Gap(16),
            Card(child: Center(child: Text("Welcome!!!")))
          ])
        )
      );
  }
  }
}