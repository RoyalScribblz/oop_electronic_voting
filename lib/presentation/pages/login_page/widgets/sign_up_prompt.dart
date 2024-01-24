import 'package:flutter/material.dart';

import '../../sign_up_page/sign_up_page.dart';

class SignUpPrompt extends StatelessWidget {
  const SignUpPrompt({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    NavigatorState nav = Navigator.of(context);

    return GestureDetector(
      onTap: () => nav.push(MaterialPageRoute(
          builder: (_) => const SignUpPage())),
      child: RichText(
        text: TextSpan(
          text: "Don't have an account? ",
          style: TextStyle(color: theme.textTheme.bodyLarge?.color),
          children: [
            TextSpan(
              text: "Sign Up",
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