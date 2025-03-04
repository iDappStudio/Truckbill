import 'package:freezed_annotation/freezed_annotation.dart';

part 'shipping_letter.freezed.dart'; 

@freezed
abstract class ShippingLetter with _$ShippingLetter {
  const factory ShippingLetter({
    required String letterNumber,
    required String loadingPlace,
    required DateTime loadingDate,
    required String unloadingPlace,
    required DateTime unloadingDate,
    required double price,
    required List<String> documentScans,
  }) = _ShippingLetter;

}
