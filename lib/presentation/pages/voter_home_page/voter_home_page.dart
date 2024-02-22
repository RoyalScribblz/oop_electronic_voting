import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:oop_electronic_voting/presentation/controllers/cubits/user_cubit.dart';
import 'package:oop_electronic_voting/presentation/pages/vote_page/vote_page.dart';

import '../../../data/models/cubit_models/user.dart';

class VoterHomePage extends StatelessWidget {
  const VoterHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    User user = context.watch<UserCubit>().state;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Welcome ${user.voter!.firstName}, you may vote in the following elections:"),
              ],
            ),
            const SizedBox(height: 20),
            const ElectionPreview(),
            const SizedBox(height: 20),
            const ElectionPreview(),
            const SizedBox(height: 20),
            const ElectionPreview(),
          ],
        ),
      ),
    );
  }
}

class ElectionPreview extends StatelessWidget {
  const ElectionPreview({
    super.key,
  });

  List<Color> generateRandomColors(int numberOfColors) {
    final List<Color> colors = [];
    final Random random = Random();

    // Generate a random starting point on the color wheel
    final double startHue = random.nextDouble() * 360.0;

    // Calculate the hue step size to equally space the colors
    final double hueStep = 360.0 / numberOfColors;

    for (int i = 0; i < numberOfColors; i++) {
      // Calculate the hue for this color
      final double hue = (startHue + i * hueStep) % 360.0;

      // Convert the HSL color to RGB
      final Color color = HSLColor.fromAHSL(1.0, hue, 1.0, 0.5).toColor();

      colors.add(color);
    }

    return colors;
  }

  @override
  Widget build(BuildContext context) {
    NavigatorState nav = Navigator.of(context);

    DateTime electionTime = DateTime(2024, 2, 2, 20, 0, 0);
    Duration difference = electionTime.difference(DateTime.now());
    String differenceText;
    if (difference.inDays >= 14) {
      differenceText = '${difference.inDays ~/ 7} weeks remaining';
    } else if (difference.inDays >= 2) {
      differenceText = '${difference.inDays} days remaining';
    } else if (difference.inHours >= 2) {
      differenceText = '${difference.inHours} hours remaining';
    } else if (difference.inMinutes >= 2) {
      differenceText = '${difference.inMinutes} minutes remaining';
    } else {
      differenceText = '${difference.inSeconds} seconds remaining';
    }
    List<Color> colours = generateRandomColors(3);

    return GestureDetector(
      onTap: () =>
          nav.push(MaterialPageRoute(builder: (_) => const VotePage())),
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 600,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(Icons.flag_outlined, color: Colors.yellow),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Really Super Cool Election"),
                      Text(
                          "Ending ${DateFormat('dd/MM/yyyy HH:mm:ss').format(electionTime)} ($differenceText)")
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text("Candidates:"),
                  const SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: colours[0]),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(3),
                      child: Row(
                        children: [
                          Icon(Icons.person_outline),
                          Text("Robert Anderson")
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: colours[1]),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(3),
                      child: Row(
                        children: [
                          Icon(Icons.person_outline),
                          Text("Neil Jackson")
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: colours[2]),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(3),
                      child: Row(
                        children: [
                          Icon(Icons.person_outline),
                          Text("Michael Davies")
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
