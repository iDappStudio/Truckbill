import 'package:injectable/injectable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:truckbill/data/shipping_letter/dtos/shipping_letter_dto.dart';

@singleton
class ShippingLetterDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference<ShippingLetterDto> _userDocumentCollection(String userId) => _firestore
      .collection('users/$userId/documents')
      .withConverter<ShippingLetterDto>(
        fromFirestore: (snapshot, _) => ShippingLetterDto.fromJson(snapshot.data()!),
        toFirestore: (dto, _) => dto.toJson(),
      );

  ShippingLetterDto fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot, SnapshotOptions? _) {
    return ShippingLetterDto.fromJson(snapshot.data()!);
  }

   Map<String, Object?> toFirestore(ShippingLetterDto dto, SetOptions? _) {
      return dto.toJson();
   }

  Future<void> createShippingLetter(ShippingLetterDto dto,String userId) async {
    try {
      await _userDocumentCollection(userId).add(dto);
    } catch (e) {
      throw Exception("Failed to create shipping letter.");
    }
  }

  Future<List<ShippingLetterDto>> getShippingLetter(String userId) async {
    try {
      final querySnapshot = await _userDocumentCollection(userId).get();

      return querySnapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      throw Exception("Failed to fetch shipping letters.");
    }
  }

  Future<ShippingLetterDto> getShippingLetterById(String id, String userId) async {
    try {
      final doc = await _userDocumentCollection(userId).doc(id).get();

      if (!doc.exists) {
        throw Exception("Shipping letter not found.");
      }

      return doc.data()!;
    } catch (e) {
      throw Exception("Failed to fetch shipping letter.");
    }
  }
}
