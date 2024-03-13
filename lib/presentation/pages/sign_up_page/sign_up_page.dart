import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oop_electronic_voting/presentation/controllers/cubits/elections_cubit.dart';
import 'package:oop_electronic_voting/presentation/controllers/cubits/user_cubit.dart';

import '../../../data/models/cubit_models/user.dart';
import '../../../data/models/dtos/user/user_dto.dart';
import '../home_page/home_page.dart';
import '../common/widgets/outlined_container.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController emailController = TextEditingController();

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
  String phoneNumber = "";

  @override
  void initState() {
    super.initState();

    Identity user = context.read<IdentityCubit>().state;
    if (user.credentials?.user.email != null) {
      emailController.text = user.credentials!.user.email!;
    }
  }

  @override
  Widget build(BuildContext context) {
    NavigatorState nav = Navigator.of(context);
    IdentityCubit user = context.watch<IdentityCubit>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedColumn(
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
                      controller: emailController,
                      decoration: const InputDecoration(labelText: "Email"),
                    ),
                    TextField(
                      decoration:
                          const InputDecoration(labelText: "Phone Number"),
                      onChanged: (value) => phoneNumber = value,
                    ),
                    const SizedBox(height: 30),
                    OutlinedButton(
                      onPressed: () async {
                        DateTime? dateTime =
                            DateTime.tryParse(dateOfBirthController.text);

                        if (dateTime == null) {
                          print("Date of birth is invalid!");
                          return;
                        }

                        UserDto newUser = UserDto(
                          userId: user.state.credentials!.user.sub,
                          nationalId: nationalId,
                          firstName: firstName,
                          lastName: lastName,
                          middleName: middleName,
                          dateOfBirth: dateTime,
                          address: address,
                          postcode: postcode,
                          country: country,
                          email: emailController.text,
                          phoneNumber: phoneNumber,
                        );

                        await user.createAndSetUser(newUser);

                        await nav.push(MaterialPageRoute(
                          builder: (_) => MultiBlocProvider(
                            providers: [
                              BlocProvider(create: (_) => user),
                              BlocProvider(create: (_) => ElectionsCubit()),
                            ],
                            child: const HomePage(),
                          ),
                        ));
                      },
                      child: const Text("Sign Up"),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}