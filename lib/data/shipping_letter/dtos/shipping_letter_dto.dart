import 'package:freezed_annotation/freezed_annotation.dart';

part 'shipping_letter_dto.freezed.dart';
part 'shipping_letter_dto.g.dart';
@freezed
abstract class ShippingLetterDto with _$ShippingLetterDto {
  factory ShippingLetterDto({
    required String letterNumber,
    required String loadingPlace,
    required DateTime loadingDate,
    required String unloadingPlace,
    required DateTime unloadingDate,
    required double price,
    required List<String> documentScans,
  }) = _ShippingLetterDto;

  factory ShippingLetterDto.fromJson(Map<String, dynamic> json) => _$ShippingLetterDtoFromJson(json);

}
