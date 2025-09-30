import 'package:arcane/arcane.dart';
import 'package:arcane_auth/arcane_auth.dart';
import 'package:arcane_fluf/init.dart';
import 'package:firebase_auth/firebase_auth.dart' as fa;
import 'package:kitchn/services/auth.dart';
import 'package:serviced/serviced.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'firebase_options.dart';
import 'kitchn_models.dart';
import 'models/user/user.dart';
import 'screens/home.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    if($uid != null && fa.FirebaseAuth.instance.currentUser != null) {
      try{
        String f = $user.documentId!;
      }
      
      catch(_){
        print("Caught we should bind!");
        svc<KitchnUserService>().bind(UserMeta(fa.FirebaseAuth.instance.currentUser!, [])).thenRun((_) => print("Force bound!"));
      }
    }
    
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) => AuthenticatedArcaneApp(
    authConfig: ArcaneAuthConfig(
        authMethods: [
          AuthMethod.emailPassword
        ],
        onBind: svc<KitchnUserService>().bind,
        onUnbind: svc<KitchnUserService>().unbind
    ),
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
  User? get userOr => pylonOr<User>();
}