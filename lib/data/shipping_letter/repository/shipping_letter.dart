import 'package:injectable/injectable.dart';
import 'package:truckbill/data/shipping_letter/datasource/shipping_letter_data_source.dart';
import 'package:truckbill/domain/auth/repository/auth_repository.dart';
import 'package:truckbill/domain/shipping_letter/models/shipping_letter.dart';
import 'package:truckbill/domain/shipping_letter/repository/shipping_letter.dart';
import 'package:truckbill/domain/mapper/shipping_letter_mapper/shipping_letter_mapper.dart';

@Singleton(as: ShippingLetterRepository)
class ShippingLetterRepositoryImpl implements ShippingLetterRepository {
  ShippingLetterRepositoryImpl(this._shippingLetterDataSource, this._authRepository, this._shippingLetterMapper);

  final ShippingLetterDataSource _shippingLetterDataSource;
  final AuthRepository _authRepository;
  final ShippingLetterMapper _shippingLetterMapper;

  @override
  Future<void> createShippingLetter(ShippingLetter letter) async {
    final userId = _authRepository.userId;
    final dto = _shippingLetterMapper.toDto(letter);
    return _shippingLetterDataSource.createShippingLetter(dto, userId);
  }

  @override
  Future<List<ShippingLetter>> getShippingLetter() async {
    final userId = _authRepository.userId;
    final dtos = await _shippingLetterDataSource.getShippingLetter(userId);
    return dtos.map((dto) => _shippingLetterMapper.toDomain(dto)).toList();
  }

  @override
  Future<ShippingLetter> getShippingLetterById(String id) async {
    final userId = _authRepository.userId;
    final dto = await _shippingLetterDataSource.getShippingLetterById(id, userId);
    return _shippingLetterMapper.toDomain(dto);
  }
}
