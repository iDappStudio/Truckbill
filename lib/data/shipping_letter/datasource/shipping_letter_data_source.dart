import 'package:injectable/injectable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:truckbill/data/shipping_letter/dtos/shipping_letter_dto.dart';

@singleton
class ShippingLetterDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createShippingLetter(ShippingLetterDto dto, String userId) async {
    try {
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('documents')
          .withConverter<ShippingLetterDto>(
            fromFirestore: (snapshot, _) => ShippingLetterDto.fromJson(snapshot.data()!),
            toFirestore: (dto, _) => dto.toJson(),
          )
          .add(dto);
    } catch (e) {
      throw Exception("Failed to create shipping letter.");
    }
  }

  Future<List<ShippingLetterDto>> getShippingLetter(String userId) async {
    try {
      final querySnapshot =
          await _firestore
              .collection('users')
              .doc(userId)
              .collection('documents')
              .withConverter<ShippingLetterDto>(
                fromFirestore: (snapshot, _) => ShippingLetterDto.fromJson(snapshot.data()!),
                toFirestore: (dto, _) => dto.toJson(),
              )
              .get();

      return querySnapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      throw Exception("Failed to fetch shipping letters.");
    }
  }

  Future<ShippingLetterDto> getShippingLetterById(String id, String userId) async {
    try {
      final doc =
          await _firestore
              .collection('users')
              .doc(userId)
              .collection('documents')
              .withConverter<ShippingLetterDto>(
                fromFirestore: (snapshot, _) => ShippingLetterDto.fromJson(snapshot.data()!),
                toFirestore: (dto, _) => dto.toJson(),
              )
              .doc(id)
              .get();

      if (!doc.exists) {
        throw Exception("Shipping letter not found.");
      }

      return doc.data()!;
    } catch (e) {
      throw Exception("Failed to fetch shipping letter.");
    }
  }
}
