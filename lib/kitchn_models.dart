import 'package:fire_crud/fire_crud.dart';
import 'package:kitchn/models/user/user.dart';

import 'gen/artifacts.gen.dart';

void registerCrud() {
  $crud
    .registerModel(FireModel<User>(
        collection: "user",
        model: User(),
        toMap: (m) => m.toMap(),
        fromMap: (m) => $User.fromMap(m)));
}
