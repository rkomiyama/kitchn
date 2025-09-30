import 'package:arcane/arcane.dart';

import '../models/user/user.dart';
import '../models/user/user_capabilities.dart';
import '../models/user/user_private.dart';
import '../services/auth.dart';
import 'direct_provider.dart';

class UserProvider extends StatelessWidget {
  final PylonBuilder builder;

  const UserProvider({super.key, required this.builder});

  @override
  Widget build(BuildContext context) => DirectProvider<User>(
      stream: $userStream,
      builder: (context) => DirectProvider<UserPrivate>(
          stream: $settingsStream,
          builder: (context) => DirectProvider<UserCapabilities>(
              stream: $capabilitiesStream,
              builder: (context) => builder(context))));
}
