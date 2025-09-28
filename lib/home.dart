import 'package:arcane/arcane.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
            BasicCard(
                title: Text("Browse recipes"),
                leading: Icon(Icons.magnifying_glass),
            ),
            BasicCard(
                title: Text("My recipes"),
                leading: Icon(Icons.book_open)
            ),
            BasicCard(
                title: Text("Start cooking session"),
                leading: Icon(Icons.cooking_pot)
            ),
            BasicCard(
                title: Text("Join with Code/Link"),
                leading: Icon(Icons.people_ionic)
            ),
          ]
        )
      )
    );
  }
}