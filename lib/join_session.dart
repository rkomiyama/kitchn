import 'package:arcane/arcane.dart';

class JoinSessionScreen extends StatefulWidget {
  const JoinSessionScreen({super.key});

  @override
  State<JoinSessionScreen> createState() => _JoinSessionScreenState();
}

class _JoinSessionScreenState extends State<JoinSessionScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(child: PrimaryButton(child: Text("Go back"), onPressed: () => Arcane.pop(context),));
  }
}