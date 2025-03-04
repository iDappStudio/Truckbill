import 'package:freezed_annotation/freezed_annotation.dart';

part 'shopping_letter_dto.freezed.dart';
part 'shopping_letter_dto.g.dart';

@freezed
abstract class ShoppingLetterDto with _$ShoppingLetterDto {
  factory ShoppingLetterDto({
    required String numerListu,
    required String miejsceZaladunku,
    required DateTime dataZaladunku,
    required String miejsceRozladunku,
    required DateTime dataRozladunku,
    required String kwota,
    required String listaObrazkow, 
  }) = _ShoppingLetterDto;

  factory ShoppingLetterDto.fromJson(Map<String, dynamic> json) => _$ShoppingLetterDtoFromJson(json);
}
