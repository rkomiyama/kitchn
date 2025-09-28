import 'package:arcane/arcane.dart';

import 'home.dart';
void main() {
  runApp(
    'kitchn',
    const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => ArcaneApp(
    title: 'My App',
    home: MyHomePage(),
    theme: ArcaneTheme(
        scheme: ContrastedColorScheme.fromScheme(ColorSchemes.blue),
        radius: 0.5,
        surfaceOpacity: 0.66,
        surfaceBlur: 18,
        themeMode: ThemeMode.system),
  );
}
