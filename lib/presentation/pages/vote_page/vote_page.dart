import 'package:flutter/material.dart';

class VotePage extends StatelessWidget {
  const VotePage({super.key});

  @override
  Widget build(BuildContext context) {
    NavigatorState nav = Navigator.of(context);

    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  const Text("Vote"),
                  const CandidateSelector(),
                  OutlinedButton(
                    onPressed: () => nav.pop(),
                    child: const Text("Submit Vote"),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum Candidate { robert, neil, michael }

class CandidateSelector extends StatefulWidget {
  const CandidateSelector({super.key});

  @override
  State<CandidateSelector> createState() => _CandidateSelectorState();
}

class _CandidateSelectorState extends State<CandidateSelector> {
  Candidate? _candidate = Candidate.robert;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 600),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: <Widget>[
          ListTile(
            title: const Text('Robert Anderson'),
            leading: Radio<Candidate>(
              value: Candidate.robert,
              groupValue: _candidate,
              onChanged: (Candidate? value) {
                setState(() {
                  _candidate = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Neil Jackson'),
            leading: Radio<Candidate>(
              value: Candidate.neil,
              groupValue: _candidate,
              onChanged: (Candidate? value) {
                setState(() {
                  _candidate = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Michael Davies'),
            leading: Radio<Candidate>(
              value: Candidate.michael,
              groupValue: _candidate,
              onChanged: (Candidate? value) {
                setState(() {
                  _candidate = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
