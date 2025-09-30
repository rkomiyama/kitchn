import 'package:arcane/arcane.dart';
import 'package:kitchn/screens/register.dart';
import 'package:kitchn/screens/sign_in.dart';

import '../widgets/navbar.dart';
import '../widgets/user_provider.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Get the width of the screen
    double screenWidth = MediaQuery.of(context).size.width;

    return UserProvider(
      builder: (context) =>
      Scaffold(
        headers: [NavBar()],
        child: FillScreen(
          gutter: false,
          child: Row(
            children: [
              if (screenWidth >= 1000)
                ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: screenWidth / 2,
                      maxWidth: screenWidth / 2,
                      minHeight: MediaQuery.of(context).size.height,
                    ),
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      padding: const EdgeInsets.all(0),
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(16),
                          bottomRight: Radius.circular(16)),
                      child: Stack(
                        children: [
                          // Background image
                          Positioned.fill(
                            child: Image.asset(
                              'assets/auth_backgrounds/authentication_background.jpg', // Replace with your actual asset path
                              fit: BoxFit.cover,
                              alignment: Alignment.bottomRight,
                            ),
                          ),
                          // Copyright text
                          const Positioned(
                            bottom: 16,
                            right: 16,
                            child: Text(
                              'Copyright @cobobayangno',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                shadows: [
                                  Shadow(
                                    offset: Offset(2, 2),
                                    blurRadius: 4,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: screenWidth >= 1000 ? screenWidth / 2 : screenWidth,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.cooking_pot),
                        const Gap(16),
                        Tabs(
                          index: _tabIndex,
                          children: const [
                            TabItem(child: Text('Sign In')),
                            TabItem(child: Text('Register')),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _tabIndex = value;
                            });
                          },
                        ),
                        const Gap(16),
                        Container(
                          constraints:
                          const BoxConstraints(maxWidth: 352, minWidth: 250),
                          child: IndexedStack(
                            index: _tabIndex,
                            children: const [
                              SignInDialog(),
                              RegisterDialog(),
                            ],
                          ),
                        ),
                        const Gap(16),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
      ),
    ));
  }
}
