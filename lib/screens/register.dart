import 'package:arcane/arcane.dart';
import 'package:arcane_fluf/arcane_fluf.dart';
import 'package:flutter/services.dart';
import 'package:serviced/serviced.dart';

class RegisterDialog extends StatefulWidget with ArcaneDialogLauncher {
  const RegisterDialog({super.key});

  @override
  State<RegisterDialog> createState() => _RegisterDialogState();
}

class _RegisterDialogState extends State<RegisterDialog> {
  final TextEditingController email = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  final FocusNode emailFocus = FocusNode();
  final FocusNode usernameFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final FocusNode confirmPasswordFocus = FocusNode();

  bool hasUppercase = false;
  bool hasLowercase = false;
  bool hasSpecialCharacter = false;
  bool hasNumericCharacter = false;
  bool hasMinLength = false;
  bool passwordsMatch = true;
  bool isButtonEnabled = false;
  bool isObscured = true;

  @override
  void initState() {
    super.initState();
    // Defer the initial focus to avoid layout conflicts
    WidgetsBinding.instance.addPostFrameCallback((_) {
      emailFocus.requestFocus();
    });
  }

  @override
  void dispose() {
    email.dispose();
    username.dispose();
    password.dispose();
    confirmPassword.dispose();

    emailFocus.dispose();
    usernameFocus.dispose();
    passwordFocus.dispose();
    confirmPasswordFocus.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    if (!mounted) return;

    const TextToast("Account Created. Welcome!").open(context);
    await svc<AuthService>().registerWithEmailPassword(
      email: email.text, password: password.text);

  }

  void _checkPassword(String pwd) {
    setState(() {
      hasUppercase = pwd.contains(RegExp(r'[A-Z]'));
      hasLowercase = pwd.contains(RegExp(r'[a-z]'));
      hasSpecialCharacter = pwd.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
      hasNumericCharacter = pwd.contains(RegExp(r'[0-9]'));
      hasMinLength = pwd.length >= 8;
      passwordsMatch = pwd == confirmPassword.text && pwd.isNotEmpty;
      _updateButtonState();
    });
  }

  void _checkConfirmPassword(String confirmPwd) {
    setState(() {
      passwordsMatch = password.text == confirmPwd && confirmPwd.isNotEmpty;
      _updateButtonState();
    });
  }

  void _updateButtonState() {
    isButtonEnabled = email.text.isNotEmpty &&
        username.text.isNotEmpty &&
        // hasUppercase &&
        hasLowercase &&
        // hasSpecialCharacter &&
        // hasNumericCharacter &&
        // hasMinLength &&
        passwordsMatch;
  }

  @override
  Widget build(BuildContext context) => Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      TextField(
        leading: const Icon(Icons.person_outline_ionic),
        maxLength: 32,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        controller: username,
        placeholder: Text("Username"),
        focusNode: usernameFocus,
        onChanged: (_) => setState(_updateButtonState),
        onSubmitted: (_) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            passwordFocus.requestFocus();
          });
        },
      ),
      const Gap(8),
      TextField(
        leading: const Icon(Icons.mail_outline_ionic),
        maxLength: 128,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        controller: email,
        placeholder: Text("Email"),
        autofocus: true,
        focusNode: emailFocus,
        onChanged: (_) => setState(_updateButtonState),
        onSubmitted: (_) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            usernameFocus.requestFocus();
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
        onChanged: _checkPassword,
        onSubmitted: (_) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            confirmPasswordFocus.requestFocus();
          });
        },
      ),
      const Gap(8),
      TextField(
        leading: const Icon(Icons.lock_closed_ionic),
        maxLength: 2048,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        controller: confirmPassword,
        placeholder: Text("Confirm Password"),
        focusNode: confirmPasswordFocus,
        obscureText: isObscured,
        onChanged: _checkConfirmPassword,
        onSubmitted: (_) => _register(),
      ),
      if (!passwordsMatch)
        const Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Text(
            "Passwords do not match",
            style: TextStyle(color: Colors.red),
          ),
        ),
      const Gap(16),
      OutlineButton(
        onPressed: isButtonEnabled ? _register : null,
        child: const Text("Register"),
      ),
    ],
  );
}
