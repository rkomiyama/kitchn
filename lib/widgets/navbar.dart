import 'package:arcane/arcane.dart';
import 'package:arcane_auth/arcane_auth.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Bar(leading: [
      Gap(8),
      Icon(Icons.cooking_pot),
      Text("kitchn")],
      trailing: [
        if ($signedIn)
          OutlineButton(
            density: ButtonDensity.icon,
            child: Icon(Icons.person_circle_outline_ionic)),
      ],
    );
  }
}