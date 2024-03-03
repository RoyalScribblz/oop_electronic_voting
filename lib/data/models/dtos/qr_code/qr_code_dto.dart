import 'package:json_annotation/json_annotation.dart';

part 'qr_code_dto.g.dart';

@JsonSerializable()
class QrCodeDto {
  final String qrCodeId;
  final String electionId;

  QrCodeDto({
    required this.qrCodeId,
    required this.electionId,
  });

  factory QrCodeDto.fromJson(Map<String, dynamic> json) => _$QrCodeDtoFromJson(json);

  Map<String, dynamic> toJson() => _$QrCodeDtoToJson(this);
}