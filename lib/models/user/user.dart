import 'package:fire_crud/fire_crud.dart';
import 'package:artifact/artifact.dart';

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

  ];

  toMap() {
    return {
      username,
      lastOnline
    };
  }

  fromMap(Map<String, dynamic> userMap) {
    username = userMap['username'];
    lastOnline = userMap['lastOnline'];
  }
}

