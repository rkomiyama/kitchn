import 'package:arcane/arcane.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: BasicCard(
                    title: Center(child: Basic(title: Text("Browse recipes"), leading: Icon(Icons.magnifying_glass))),
                ).withMargin(all: 16),
              ),
              Expanded(
                child: BasicCard(
                    title: Center(child: Basic(title: Text("My recipes"), leading: Icon(Icons.book_open))),
                ).withMargin(all: 16),
              ),
              Expanded(
                child: BasicCard(
                    title: Center(child: Basic(title: Text("Start cooking session"), leading: Icon(Icons.cooking_pot))),
                ).withMargin(all: 16),
              ),
              Expanded(
                child: BasicCard(
                    title: Center(child: Basic(title: Text("Join with Code/Link"), leading: Icon(Icons.people_ionic))),
                ).withMargin(all: 16),
              ),
          ]
        )
      )
    );
  }
}