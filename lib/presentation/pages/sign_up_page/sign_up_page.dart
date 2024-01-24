import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'widgets/login_prompt.dart';
import '../../../data/models/contracts/voter_contracts/create_voter_request.dart';
import '../../../data/repositories/voter_repository.dart';
import '../common/widgets/outlined_container.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController dateOfBirthController = TextEditingController();

  Future<void> _selectDateOfBirth(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1906),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        dateOfBirthController.text = picked.toString();
      });
    }
  }

  String nationalId = "";
  String firstName = "";
  String lastName = "";
  String middleName = "";
  String address = "";
  String postcode = "";
  String country = "";
  String email = "";
  String phoneNumber = "";
  String password = "";
  String passwordConfirmation = "";

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
                    TextField(
                      decoration:
                          const InputDecoration(labelText: "National Id"),
                      onChanged: (value) => nationalId = value,
                    ),
                    TextField(
                      decoration:
                          const InputDecoration(labelText: "First Name"),
                      onChanged: (value) => firstName = value,
                    ),
                    TextField(
                      decoration:
                          const InputDecoration(labelText: "Middle Name(s)"),
                      onChanged: (value) => middleName = value,
                    ),
                    TextField(
                      decoration: const InputDecoration(labelText: "Last Name"),
                      onChanged: (value) => lastName = value,
                    ),
                    TextField(
                      controller: dateOfBirthController,
                      decoration: InputDecoration(
                        labelText: "Date of Birth",
                        suffixIcon: IconButton(
                            onPressed: () => _selectDateOfBirth(context),
                            icon: const Icon(Icons.calendar_month)),
                      ),
                    ),
                    TextField(
                      decoration:
                          const InputDecoration(labelText: "Address Line 1"),
                      onChanged: (value) => address = value,
                    ),
                    TextField(
                      decoration: const InputDecoration(labelText: "Postcode"),
                      onChanged: (value) => postcode = value,
                    ),
                    TextField(
                      decoration: const InputDecoration(labelText: "Country"),
                      onChanged: (value) => country = value,
                    ),
                    TextField(
                      decoration: const InputDecoration(labelText: "Email"),
                      onChanged: (value) => email = value,
                    ),
                    TextField(
                      decoration:
                          const InputDecoration(labelText: "Phone Number"),
                      onChanged: (value) => phoneNumber = value,
                    ),
                    TextField(
                      decoration: const InputDecoration(labelText: "Password"),
                      onChanged: (value) => password = value,
                      obscureText: true,
                    ),
                    TextField(
                      decoration:
                          const InputDecoration(labelText: "Confirm Password"),
                      onChanged: (value) => passwordConfirmation = value,
                      obscureText: true,
                    ),
                    const SizedBox(height: 30),
                    OutlinedButton(
                      onPressed: () async {
                        if (password != passwordConfirmation) {
                          print("Passwords do not match!");
                          return;
                        }

                        String passwordHash =
                            sha256.convert(utf8.encode(password)).toString();

                        DateTime? dateTime = DateTime.tryParse(dateOfBirthController.text);

                        if (dateTime == null) {
                          print("Date of birth is invalid!");
                          return;
                        }

                        CreateVoterRequest createVoteRequest =
                            CreateVoterRequest(
                          nationalId: nationalId,
                          firstName: firstName,
                          lastName: lastName,
                          middleName: middleName,
                          dateOfBirth: dateTime,
                          address: address,
                          postcode: postcode,
                          country: country,
                          email: email,
                          phoneNumber: phoneNumber,
                          passwordHash: passwordHash,
                        );

                        await VoterRepository.createVoter(createVoteRequest);
                      },
                      child: const Text("Sign Up"),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            const LoginPrompt(),
          ],
        ),
      ),
    );
  }
}
