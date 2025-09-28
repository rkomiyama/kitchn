import 'package:arcane/arcane.dart';

void main() {
  runApp(
    'Yoooooo',
    ArcaneApp(
      title: 'My App',
      home: MyHomePage(),
      theme: ArcaneTheme(
          scheme: ContrastedColorScheme.fromScheme(ColorSchemes.blue),
          radius: 0.5,
          surfaceOpacity: 0.66,
          surfaceBlur: 18,
          themeMode: ThemeMode.system
      ),
    ),
  );
}

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
    return const Center(
      child: Text(
        'Hello, world!',
        textDirection: TextDirection.ltr,
        style: TextStyle(color: Colors.blue),
      ),
    );
  }
}
