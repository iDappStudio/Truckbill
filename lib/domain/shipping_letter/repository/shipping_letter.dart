import 'package:truckbill/domain/shipping_letter/models/shipping_letter.dart';

abstract class ShippingLetterRepository {
  Future<void> createShippingLetter(ShippingLetter letter);
  Future<List<ShippingLetter>> getShippingLetter();
  Future<ShippingLetter> getShippingLetterById(String id);
}
