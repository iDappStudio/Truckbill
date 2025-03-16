import 'package:injectable/injectable.dart';
import 'package:truckbill/data/shipping_letter/dtos/shipping_letter_dto.dart';
import 'package:truckbill/domain/shipping_letter/models/shipping_letter.dart';

@injectable
class ShippingLetterMapper {
  ShippingLetterDto toDto(ShippingLetter letter) {
    return ShippingLetterDto(
      letterNumber: letter.letterNumber,
      loadingPlace: letter.loadingPlace,
      loadingDate: letter.loadingDate,
      unloadingPlace: letter.unloadingPlace,
      unloadingDate: letter.unloadingDate,
      price: letter.price,
      documentScans: letter.documentScans,
    );
  }

  ShippingLetter toDomain(ShippingLetterDto dto) {
    return ShippingLetter(
      letterNumber: dto.letterNumber,
      loadingPlace: dto.loadingPlace,
      loadingDate: dto.loadingDate,
      unloadingPlace: dto.unloadingPlace,
      unloadingDate: dto.unloadingDate,
      price: dto.price,
      documentScans: dto.documentScans,
    );
  }

}
