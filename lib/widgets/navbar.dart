import 'package:arcane/arcane.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: [
        OutlineButton(
          density: ButtonDensity.icon,
          onPressed: () => Arcane.pop(context),
          child: const Icon(Icons.arrow_back_ionic),
        ),
      ],
    title: Center(child: Text("kitchn")),
    );
  }
}