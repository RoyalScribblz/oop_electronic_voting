import 'package:flutter/material.dart';
import 'package:oop_electronic_voting/presentation/pages/common/widgets/outlined_container.dart';
import 'package:oop_electronic_voting/presentation/pages/voter_home_page/voter_home_page.dart';

import 'widgets/sign_up_prompt.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    NavigatorState nav = Navigator.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedContainer(
                  maxWidth: 600,
                  borderRadius: 20,
                  innerPadding: 30,
                  children: [
                    const TextField(
                      decoration: InputDecoration(labelText: "Email Address"),
                    ),
                    const TextField(
                      decoration: InputDecoration(labelText: "Password"),
                      obscureText: true,
                    ),
                    const SizedBox(height: 30),
                    OutlinedButton(
                      onPressed: () => nav.push(MaterialPageRoute(
                          builder: (_) => const VoterHomePage())),
                      child: const Text("Login"),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            const SignUpPrompt(),
          ],
        ),
      ),
    );
  }
}
