import 'package:arcane/arcane.dart';
import 'package:arcane_auth/service/auth_service.dart';
import 'package:arcane_fluf/init.dart';
import 'package:kitchn/services/auth.dart';
import 'package:serviced/serviced.dart';

import 'firebase_options.dart';
import 'kitchn_models.dart';
import 'models/user/user.dart';
import 'screens/home.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    'kitchn',
    ArcaneFluf(
      options: DefaultFirebaseOptions.currentPlatform,
      onRegisterCrud: registerCrud,
      onRegisterServices: registerServices,
      child: const MyApp(),
    )
  );
}

void registerServices(ServiceProvider s) => s
  ..register<AuthService>(() => AuthService(), lazy: false)
  ..register<KitchnUserService>(() => KitchnUserService());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => ArcaneApp(
    title: 'kitchn',
    home: MyHomePage(),
    theme: ArcaneTheme(
        scheme: ContrastedColorScheme.fromScheme(ColorSchemes.blue),
        radius: 0.5,
        surfaceOpacity: 0.66,
        surfaceBlur: 18,
        themeMode: ThemeMode.system),
  );
}

extension XBuildContext on BuildContext {
  User get user => pylon<User>();
}