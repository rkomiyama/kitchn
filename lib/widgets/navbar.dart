import 'package:arcane/arcane.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Bar(leading: [
      Gap(8),
      Text("kitchn")],
      trailing: [
        OutlineButton(
          density: ButtonDensity.icon,
          child: Icon(Icons.person_circle_outline_ionic)),
      ],
    );
  }
}