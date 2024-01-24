import 'package:flutter/material.dart';
import 'package:oop_electronic_voting/data/models/contracts/voter_contracts/create_voter_request.dart';
import 'package:oop_electronic_voting/data/repositories/voter_repository.dart';
import 'package:oop_electronic_voting/presentation/pages/common/widgets/outlined_container.dart';

import 'widgets/sign_up_prompt.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                      // onPressed: () => nav.push(MaterialPageRoute(
                      //     builder: (_) => const VoterHomePage())),
                      onPressed: () async => await VoterRepository.createVoter(
                          CreateVoterRequest(
                              nationalId: "nationalId",
                              firstName: "firstName",
                              lastName: "lastName",
                              middleName: "middleName",
                              dateOfBirth: DateTime.now(),
                              address: "address",
                              postcode: "postcode",
                              country: "country",
                              email: "email",
                              phoneNumber: "phoneNumber",
                              passwordHash: "passwordHash")),
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
