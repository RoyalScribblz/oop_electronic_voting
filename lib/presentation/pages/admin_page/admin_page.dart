import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../common/widgets/outlined_container.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
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
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () => _colourPicker(context),
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                  color: Colors.primaries[Random()
                                      .nextInt(Colors.primaries.length)],
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white)),
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text("Donald J. Trump"),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(value: true, onChanged: (_) => {}),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () => _colourPicker(context),
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                  color: Colors.primaries[Random()
                                      .nextInt(Colors.primaries.length)],
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white)),
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text("Donald J. Trump"),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(value: true, onChanged: (_) => {}),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () => _colourPicker(context),
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                  color: Colors.primaries[Random()
                                      .nextInt(Colors.primaries.length)],
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white)),
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text("Donald J. Trump"),
                        ],
                      ),
                      ElevatedButton(onPressed: () => {}, child: const Text("Create Election"))
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  const Text("Election Results:"),
                  OutlinedColumn(
                    maxWidth: 600,
                    borderRadius: 20,
                    innerPadding: 10,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text("Cool Election"),
                          const SizedBox(width: 10),
                          DataTable(
                            border: TableBorder(
                              left: BorderSide(color: theme.colorScheme.outlineVariant, width: 1)
                            ),
                            columns: const [
                              DataColumn(label: Text("James")),
                              DataColumn(
                                  label: Text(
                                "Moe",
                                style: TextStyle(color: Colors.green),
                              )),
                              DataColumn(label: Text("Freddie")),
                            ],
                            rows: const [
                              DataRow(
                                cells: [
                                  DataCell(Text("12%")),
                                  DataCell(Text("73%")),
                                  DataCell(Text("15%")),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  OutlinedColumn(
                    maxWidth: 600,
                    borderRadius: 20,
                    innerPadding: 10,
                    children: [
                      DataTable(
                        columns: const [
                          DataColumn(label: Text("Election")),
                          DataColumn(label: VerticalDivider(width: 0, indent: 0, thickness: 1)),
                          DataColumn(label: Text("James")),
                          DataColumn(
                              label: Text(
                                "Moe",
                                style: TextStyle(color: Colors.green),
                              )),
                          DataColumn(label: Text("Freddie")),
                        ],
                        rows: const [
                          DataRow(
                            cells: [
                              DataCell(Text("Cool Election")),
                              DataCell(VerticalDivider(width: 0, indent: 0, thickness: 1)),
                              DataCell(Text("12%")),
                              DataCell(Text("73%")),
                              DataCell(Text("15%")),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  OutlinedColumn(
                    maxWidth: 600,
                    borderRadius: 20,
                    innerPadding: 10,
                    children: [
                      DataTable(
                        columns: const [
                          DataColumn(label: Text("Election")),
                          DataColumn(label: VerticalDivider(width: 0, indent: 0, thickness: 1)),
                          DataColumn(label: Text("James")),
                          DataColumn(
                              label: Text(
                                "Moe",
                                style: TextStyle(color: Colors.green),
                              )),
                          DataColumn(label: Text("Freddie")),
                        ],
                        rows: const [
                          DataRow(
                            cells: [
                              DataCell(Text("Cool Election")),
                              DataCell(VerticalDivider(width: 0, indent: 0, thickness: 1)),
                              DataCell(Text("12%")),
                              DataCell(Text("73%")),
                              DataCell(Text("15%")),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  OutlinedColumn(
                    maxWidth: 600,
                    borderRadius: 20,
                    innerPadding: 10,
                    children: [
                      DataTable(
                        columns: const [
                          DataColumn(label: Text("Election")),
                          DataColumn(label: VerticalDivider(width: 0, indent: 0, thickness: 1)),
                          DataColumn(label: Text("James")),
                          DataColumn(
                              label: Text(
                                "Moe",
                                style: TextStyle(color: Colors.green),
                              )),
                          DataColumn(label: Text("Freddie")),
                        ],
                        rows: const [
                          DataRow(
                            cells: [
                              DataCell(Text("Cool Election")),
                              DataCell(VerticalDivider(width: 0, indent: 0, thickness: 1)),
                              DataCell(Text("12%")),
                              DataCell(Text("73%")),
                              DataCell(Text("15%")),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
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
