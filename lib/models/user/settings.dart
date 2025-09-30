import 'package:artifact/artifact.dart';

@artifact
class Settings {
  final String themeMode;

  const Settings({
    this.themeMode = "system",
  });
}
