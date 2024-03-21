import 'package:auth0_flutter/auth0_flutter_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oop_electronic_voting/presentation/controllers/cubits/elections_cubit.dart';
import 'package:oop_electronic_voting/presentation/pages/common/widgets/outlined_container.dart';
import 'package:oop_electronic_voting/presentation/pages/sign_up_page/sign_up_page.dart';
import 'package:oop_electronic_voting/presentation/pages/vote_with_code_page/vote_with_code_page.dart';
import '../../controllers/cubits/user_cubit.dart';
import '../home_page/home_page.dart';

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

    _auth.onLoad(audience: "http://localhost:5238").then((credentials) async {
      IdentityCubit identityCubit = context.read<IdentityCubit>();
      await identityCubit.updateIdentity(credentials);
    });
  }

  @override
  Widget build(BuildContext context) {
    IdentityCubit identityCubit = context.watch<IdentityCubit>();

    if (identityCubit.state.credentials == null) {
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
                    child: const OutlinedColumn(
                      maxWidth: 600,
                      borderRadius: 20,
                      innerPadding: 30,
                      children: [
                        Text("Log In"),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const VoteWithCodePage())),
                    child: const OutlinedColumn(
                      maxWidth: 600,
                      borderRadius: 20,
                      innerPadding: 30,
                      children: [
                        Text("Vote with Code"),
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

    if (identityCubit.state.user == null) {
      return const SignUpPage();
    }

    return BlocProvider(
      create: (_) => ElectionsCubit(),
      child: const HomePage(),
    );
  }
}
