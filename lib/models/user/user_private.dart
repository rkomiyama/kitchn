import 'package:artifact/artifact.dart';
import 'package:fire_crud/fire_crud.dart';
import 'package:kitchn/models/user/settings.dart';

@artifact
class UserPrivate with ModelCrud {
  // self: rw
  final String email;
  final bool acceptedTerms;
  final Settings settings;

  UserPrivate({
    required this.email,
    this.settings = const Settings(),
    this.acceptedTerms = false,
  });

  @override
  List<FireModel<ModelCrud>> get childModels => [];
}
