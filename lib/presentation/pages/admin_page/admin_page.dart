import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../common/widgets/outlined_container.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                OutlinedColumn(
                  maxWidth: 600,
                  borderRadius: 20,
                  innerPadding: 30,
                  children: [
                    const TextField(
                        decoration: InputDecoration(labelText: "Name")),
                    const TextField(
                        decoration: InputDecoration(labelText: "Start Time")),
                    const TextField(
                        decoration: InputDecoration(labelText: "End Time")),
                    Row(
                      children: [
                        Checkbox(value: true, onChanged: (_) => {}),
                        const Text("Candidate A"),
                        GestureDetector(
                          onTap: () => _colourPicker(context),
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white
                              )
                            ),
                          ),
                        ),
                      ],
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

Future<void> _colourPicker(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: Colors.red,
            onColorChanged: (_) => {},
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('Select'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}