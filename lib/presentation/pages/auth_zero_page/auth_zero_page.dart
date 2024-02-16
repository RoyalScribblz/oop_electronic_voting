import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:auth0_flutter/auth0_flutter_web.dart';

import 'package:flutter/material.dart';
import 'package:oop_electronic_voting/data/repositories/voter_repository.dart';
import 'package:oop_electronic_voting/presentation/pages/common/widgets/outlined_container.dart';
import 'package:oop_electronic_voting/presentation/pages/sign_up_page/sign_up_page.dart';
import 'package:oop_electronic_voting/presentation/pages/voter_home_page/voter_home_page.dart';
import 'package:provider/provider.dart';

import '../../../data/models/dtos/voter/voter.dart';

class AuthZeroPage extends StatefulWidget {
  const AuthZeroPage({super.key});

  @override
  State<AuthZeroPage> createState() => _AuthZeroPageState();
}

class _AuthZeroPageState extends State<AuthZeroPage> {
  Credentials? _credentials;
  Voter? _voter;
  late Auth0Web auth0;

  @override
  void initState() {
    super.initState();
    auth0 = Auth0Web("dev-0zt0kwgn6ocwlua2.uk.auth0.com",
        "7W1lNDLlTLsF166UAHGDBKxzmpCpNtdk");

    auth0.onLoad().then((credentials) async {
      Voter? voter = await VoterRepository.getVoter(credentials?.user.sub);

      setState(() {
        _credentials = credentials;
        _voter = voter;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_credentials == null) {
      return Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () =>
                        auth0.loginWithRedirect(redirectUrl: 'http://localhost:55298'),
                    child: const OutlinedContainer(
                      maxWidth: 600,
                      borderRadius: 20,
                      innerPadding: 30,
                      children: [Text("Log In")],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    if (_voter == null) {
      return Provider<Credentials>(
        create: (_) => _credentials!,
        child: const SignUpPage(),
      );
    }

    return VoterHomePage(
      firstName: _credentials?.user.nickname != null
          ? _credentials!.user.nickname!
          : "{Error}",
    );
  }
}
