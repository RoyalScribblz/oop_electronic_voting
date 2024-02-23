import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:auth0_flutter/auth0_flutter_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oop_electronic_voting/data/models/cubit_models/user.dart';
import 'package:oop_electronic_voting/presentation/pages/common/widgets/outlined_container.dart';
import 'package:oop_electronic_voting/presentation/pages/sign_up_page/sign_up_page.dart';
import 'package:oop_electronic_voting/presentation/pages/voter_home_page/voter_home_page.dart';
import 'package:provider/provider.dart';
import '../../controllers/cubits/user_cubit.dart';

class AuthZeroPage extends StatefulWidget {
  const AuthZeroPage({super.key});

  @override
  State<AuthZeroPage> createState() => _AuthZeroPageState();
}

class _AuthZeroPageState extends State<AuthZeroPage> {
  final Auth0Web _auth = Auth0Web(
    "dev-0zt0kwgn6ocwlua2.uk.auth0.com",
    "7W1lNDLlTLsF166UAHGDBKxzmpCpNtdk",
  );

  @override
  void initState() {
    super.initState();

    _auth.onLoad().then((credentials) async {
      UserCubit userCubit = context.read<UserCubit>();
      await userCubit.setCredentialsAndVoter(credentials);
    });
  }

  @override
  Widget build(BuildContext context) {
    UserCubit userCubit = context.watch<UserCubit>();

    if (userCubit.state.credentials == null) {
      return Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => _auth.loginWithRedirect(
                      redirectUrl: 'http://localhost:55298',
                    ),
                    child: const OutlinedContainer(
                      maxWidth: 600,
                      borderRadius: 20,
                      innerPadding: 30,
                      children: [
                        Text("Log In"),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    if (userCubit.state.voter == null) {
      return const SignUpPage();
    }

    return const VoterHomePage();
  }
}
