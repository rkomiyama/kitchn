import 'package:arcane_fluf/arcane_fluf.dart';
import 'package:arcane_user/user_service.dart';
import 'package:serviced/serviced.dart';

import '../models/user/user.dart';
import '../models/user/user_capabilities.dart';
import '../models/user/user_private.dart';

bool get $auth {
  try {
    return $user.documentId!.isNotEmpty;
  } catch (_) {}

  return false;
}

Stream<User?> get $userStream => svc<KitchnUserService>().$userStream;
Stream<UserCapabilities?> get $capabilitiesStream => svc<KitchnUserService>().$capabilitiesStream;
Stream<UserPrivate?> get $settingsStream => svc<KitchnUserService>().$settingsStream;

User get $user => svc<KitchnUserService>().$user;
UserCapabilities get $capabilities => svc<KitchnUserService>().$capabilities;
UserPrivate get $settings => svc<KitchnUserService>().$settings;

class KitchnUserService extends ArcaneUserService<User, UserCapabilities, UserPrivate> {
  @override
  Future<void> bind(UserMeta user) async {
    print("Bound? ");
    super.bind(user);
    
  }
  
  @override
  User createUserModel(UserMeta meta) => User();

  @override
  UserCapabilities createUserCapabilitiesModel(UserMeta meta) {
    return UserCapabilities();
  }

  @override
  UserPrivate createUserSettingsModel(UserMeta meta) {
    return UserPrivate(
      email: meta.email ?? "",
      acceptedTerms: false,
    );
  }
}