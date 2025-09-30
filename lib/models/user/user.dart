import 'package:arcane/arcane.dart';
import 'package:fire_crud/fire_crud.dart';
import 'package:artifact/artifact.dart';
import 'package:kitchn/gen/artifacts.gen.dart';
import 'package:kitchn/gen/crud.gen.dart';
import 'package:kitchn/models/user/user_capabilities.dart';
import 'package:kitchn/models/user/user_private.dart';

@artifact
class User with ModelCrud {
  late final String username;
  late final DateTime? lastOnline;

  User({
    this.username = "anonymous",
    this.lastOnline,
  });

  @override
  List<FireModel<ModelCrud>> get childModels => [
    FireModel<UserPrivate>(
      collection: "data",
      model: UserPrivate(email: ""),
      exclusiveDocumentId: "private",
      fromMap: $UserPrivate.fromMap,
      toMap: (u) => u.toMap(),
    ),
    FireModel<UserCapabilities>(
      collection: "data",
      model: UserCapabilities(),
      exclusiveDocumentId: "capabilities",
      fromMap: $UserCapabilities.fromMap,
      toMap: (u) => u.toMap(),
    )
  ];
}


