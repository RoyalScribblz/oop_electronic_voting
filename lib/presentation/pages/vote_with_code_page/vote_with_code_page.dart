import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oop_electronic_voting/data/repositories/election_repository.dart';
import 'package:qr_code_dart_scan/qr_code_dart_scan.dart';

import '../../../data/models/dtos/election/election_dto.dart';
import '../../../data/models/dtos/qr_code/qr_code_dto.dart';
import '../../controllers/cubits/vote_page_cubit.dart';
import '../vote_page/vote_page.dart';

class VoteWithCodePage extends StatelessWidget {
  const VoteWithCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    NavigatorState nav = Navigator.of(context);

    return Scaffold(
      body: SafeArea(
        child: QRCodeDartScanView(
          typeScan: TypeScan.takePicture,
          resolutionPreset: QRCodeDartScanResolutionPreset.ultraHigh,
          onCapture: (Result result) async {
            QrCodeDto qrCode = QrCodeDto.fromJson(json.decode(result.text));

            ElectionDto? election =
                await ElectionRepository.getElection(qrCode.electionId);

            if (election == null) {
              throw Exception("Hardcoded election GUID failed to fetch");
            }

            await nav.push(MaterialPageRoute(
              builder: (_) => BlocProvider(
                create: (_) => VotePageCubit(election, qrCode.qrCodeId),
                child: const VotePage(),
              ),
            ));
          },
        ),
      ),
    );
  }
}
