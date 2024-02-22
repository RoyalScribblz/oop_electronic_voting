import 'package:auth0_flutter/auth0_flutter_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oop_electronic_voting/presentation/pages/common/widgets/outlined_container.dart';
import 'package:oop_electronic_voting/presentation/pages/sign_up_page/sign_up_page.dart';
import 'package:oop_electronic_voting/presentation/pages/voter_home_page/voter_home_page.dart';
import '../../controllers/cubits/user_cubit.dart';

class AuthZeroPage extends StatefulWidget {
  const AuthZeroPage({super.key});

  @override
  State<AuthZeroPage> createState() => _AuthZeroPageState();
}

class _AuthZeroPageState extends State<AuthZeroPage> {
  final UserCubit _userCubit = UserCubit();

  final Auth0Web _auth = Auth0Web(
    "dev-0zt0kwgn6ocwlua2.uk.auth0.com",
    "7W1lNDLlTLsF166UAHGDBKxzmpCpNtdk",
  );

  @override
  void initState() {
    super.initState();

    _auth.onLoad().then((credentials) async {
      await _userCubit.setCredentialsAndVoter(credentials);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_userCubit.state.credentials == null) {
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

    if (_userCubit.state.voter == null) {
      return BlocProvider<UserCubit>(
        create: (_) => _userCubit,
        child: const SignUpPage(),
      );
    }

    return BlocProvider(
      create: (_) => _userCubit,
      child: const VoterHomePage(),
    );
  }
}
