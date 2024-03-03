import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:oop_electronic_voting/data/repositories/election_repository.dart';
import 'package:qr_code_dart_scan/qr_code_dart_scan.dart';

import '../../../data/models/dtos/election/election_dto.dart';
import '../../../data/models/dtos/qr_code/qr_code_dto.dart';

class VoteWithCodePage extends StatelessWidget {
  const VoteWithCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: QRCodeDartScanView(
          typeScan: TypeScan.takePicture,
          onCapture: (Result result) async {
            QrCodeDto qrCode = QrCodeDto.fromJson(json.decode(result.text));

            ElectionDto? electionDto = await ElectionRepository.getElection(qrCode.electionId);

            if (electionDto == null) {
              throw Exception("Hardcoded election GUID failed to fetch");
            }

            print("");
            print(result.text);
            print(electionDto.name);
          },
        ),
      ),
    );
  }
}
