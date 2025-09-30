import 'package:arcane/arcane.dart';
import 'package:arcane_fluf/arcane_fluf.dart';
// import 'package:beamer/beamer.dart';
// import 'package:fast_log/fast_log.dart';
import 'package:flutter/services.dart';
import 'package:serviced/serviced.dart';

class SignInDialog extends StatefulWidget with ArcaneDialogLauncher {
  const SignInDialog({super.key});

  @override
  State<SignInDialog> createState() => _SignInDialogState();
}

class _SignInDialogState extends State<SignInDialog> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  bool isButtonEnabled = false;
  bool isObscured = true;

  @override
  void initState() {
    super.initState();
    // Defer initial focus to avoid layout conflicts
    WidgetsBinding.instance.addPostFrameCallback((_) {
      emailFocus.requestFocus();
    });

    email.addListener(_validateFields);
    password.addListener(_validateFields);
  }

  @override
  void dispose() {
    email.removeListener(_validateFields);
    password.removeListener(_validateFields);
    email.dispose();
    password.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    super.dispose();
  }

  void _validateFields() {
    final emailValid = RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email.text);
    final passwordValid = password.text.isNotEmpty;
    setState(() {
      isButtonEnabled = emailValid && passwordValid;
    });
  }

  Future<void> _signIn() async {
    // If the widget was disposed during the async call, stop here.
    if (!mounted) return;

    const TextToast("Signed In").open(context);
    await svc<AuthService>()
          .signInWithEmailPassword(email: email.text, password: password.text);
  }

  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      TextField(
        leading: const Icon(Icons.mail_outline_ionic),
        maxLength: 128,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        controller: email,
        placeholder: Text("Email"),
        focusNode: emailFocus,
        onSubmitted: (_) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            passwordFocus.requestFocus();
          });
        },
      ),
      const Gap(8),
      TextField(
        leading: const Icon(Icons.lock_closed_outline_ionic),
        trailing: Toggle(
          style: const ButtonStyle.muted(
            density: ButtonDensity.dense,
            size: ButtonSize(0.7),
          ),
          value: !isObscured,
          onChanged: (v) => setState(() {
            isObscured = !isObscured;
          }),
          child: isObscured
              ? const Icon(Icons.eye_off_ionic)
              : const Icon(Icons.eye_ionic),
        ),
        maxLength: 2048,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        controller: password,
        placeholder: Text("Password"),
        focusNode: passwordFocus,
        obscureText: isObscured,
        onSubmitted: (_) => _signIn(),
      ),
      const Gap(16),
      OutlineButton(
        onPressed: isButtonEnabled ? _signIn : null,
        child: const Text("Sign In"),
      ),
    ],
  );
}
