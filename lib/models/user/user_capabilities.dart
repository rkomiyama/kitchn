import 'package:artifact/artifact.dart';
import 'package:fire_crud/fire_crud.dart';
import 'package:kitchn/models/user/user_grant.dart';
import 'package:kitchn/models/user/user_role.dart';

@artifact
class UserCapabilities with ModelCrud {
  final UserRole role;
  final Set<UserGrant> grants;
  final DateTime? suspendedUntil;

  UserCapabilities({
    this.role = UserRole.user,
    this.grants = const {},
    this.suspendedUntil,
  });

  @override
  List<FireModel<ModelCrud>> get childModels => [];
}