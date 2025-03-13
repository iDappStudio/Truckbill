import 'package:injectable/injectable.dart';
import 'package:truckbill/data/shipping_letter/datasource/shipping_letter_data_source.dart';
import 'package:truckbill/domain/shipping_letter/models/shipping_letter.dart';
import 'package:truckbill/domain/shipping_letter/repository/shipping_letter.dart';

@Singleton(as: ShippingLetterRepository)
class ShippingLetterRepositoryImpl implements ShippingLetterRepository {
  ShippingLetterRepositoryImpl(this._shippingLetterDataSource);

  final ShippingLetterDataSource _shippingLetterDataSource;

  @override
  Future<void> createShippingLetter(ShippingLetter letter) async {
    return _shippingLetterDataSource.createShippingLetter(letter);
  }

  @override
  Future<List<ShippingLetter>> getShippingLetter() async {
    return _shippingLetterDataSource.getShippingLetter();
  }

  @override
  Future<ShippingLetter> getShippingLetterById(String id) async {
    return _shippingLetterDataSource.getShippingLetterById(id);
  }
}
