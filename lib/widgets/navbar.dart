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

// class _NavBarState extends State<NavBar> {
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       // leading: [
//       //   OutlineButton(
//       //     density: ButtonDensity.icon,
//       //     onPressed: () => Arcane.pop(context),
//       //     child: const Icon(Icons.arrow_back_ionic),
//       //   ),
//       // ],
//     title: Center(child: Text("kitchn")),
//     );
//   }
// }