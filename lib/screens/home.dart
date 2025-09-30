import 'package:arcane/arcane.dart';
import 'package:kitchn/widgets/user_provider.dart';

import '../widgets/navbar.dart';
import 'browse_recipes.dart';
import 'my_recipes.dart';
import 'cooking_session.dart';
import 'join_session.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>  {

  @override
  Widget build(BuildContext context) {
    return UserProvider(builder: (context) =>
        Scaffold(
          headers: [NavBar()],
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        child: BasicCard(
                          title: Basic(title: Text("Browse recipes"), leading: Icon(Icons.magnifying_glass)),
                          onPressed: () => Arcane.push(context, BrowseRecipesScreen()),
                        ).withMargin(all: 16),
                      ),
                      Expanded(
                        child: BasicCard(
                          title: Basic(title: Text("My recipes"), leading: Icon(Icons.book_open)),
                          onPressed: () => Arcane.push(context, MyRecipesScreen()),
                        ).withMargin(all: 16),
                      ),
                      Expanded(
                        child: BasicCard(
                          title: Basic(title: Text("Start cooking session"), leading: Icon(Icons.cooking_pot)),
                          onPressed: () => Arcane.push(context, CookingSessionScreen()),
                        ).withMargin(all: 16),
                      ),
                      Expanded(
                        child: BasicCard(
                          title: Basic(title: Text("Join with Code/Link"), leading: Icon(Icons.people_ionic)),
                          onPressed: () => Arcane.push(context, JoinSessionScreen()),
                        ).withMargin(all: 16),
                      ),
                    ]
                )
            )
        )
    );
  }
}