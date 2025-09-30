import 'package:arcane/arcane.dart';

class DirectProvider<T> extends StatelessWidget {
  final Stream<T?> stream;
  final PylonBuilder builder;

  const DirectProvider(
      {super.key, required this.stream, required this.builder});

  @override
  Widget build(BuildContext context) => stream.buildNullable((t) => Pylon<T?>(
    value: t,
    builder: builder,
  ));
}
