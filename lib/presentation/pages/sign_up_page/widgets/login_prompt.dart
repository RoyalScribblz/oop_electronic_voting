import 'package:flutter/material.dart';
import 'package:oop_electronic_voting/presentation/pages/login_page/login_page.dart';

class LoginPrompt extends StatelessWidget {
  const LoginPrompt({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    NavigatorState nav = Navigator.of(context);

    return GestureDetector(
      onTap: () => nav.push(MaterialPageRoute(
          builder: (_) => const LoginPage())),
      child: RichText(
        text: TextSpan(
          text: "Already have an account? ",
          style: TextStyle(color: theme.textTheme.bodyLarge?.color),
          children: [
            TextSpan(
              text: "Login",
              style: TextStyle(
                decoration: TextDecoration.underline,
                color: theme.colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
