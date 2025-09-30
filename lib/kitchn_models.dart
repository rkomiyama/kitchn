import 'package:fire_crud/fire_crud.dart';
import 'package:kitchn/models/user/user.dart';
import 'package:kitchn/services/auth.dart';

void registerCrud() {
  $crud
    .registerModel(FireModel<User>(
        collection: "user",
        model: User(),
        toMap: (m) => m.toMap(),
        fromMap: (m) => $user.fromMap(m)));
}
