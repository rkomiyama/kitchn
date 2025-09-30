import 'package:arcane/arcane.dart';

import '../widgets/navbar.dart';

class JoinSessionScreen extends StatefulWidget {
  const JoinSessionScreen({super.key});

  @override
  State<JoinSessionScreen> createState() => _JoinSessionScreenState();
}

class _JoinSessionScreenState extends State<JoinSessionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        headers: [NavBar()],
        child: Center(child: Text("Join session!"))
    );
  }
}