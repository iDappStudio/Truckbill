import 'package:injectable/injectable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:truckbill/data/shipping_letter/dtos/shipping_letter_dto.dart';

@Singleton()
class ShippingLetterDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createShippingLetter(ShippingLetterDto dto, String userId) async {
    try {
      await _firestore.collection('users').doc(userId).collection('documents').add(dto.toJson());
    } catch (e) {
      throw Exception("Failed to create shipping letter.");
    }
  }

  Future<List<ShippingLetterDto>> getShippingLetter(String userId) async {
    try {
      final querySnapshot = await _firestore.collection('users').doc(userId).collection('documents').get();
      return querySnapshot.docs.map((doc) {
        return ShippingLetterDto.fromJson(doc.data());
      }).toList();
    } catch (e) {
      throw Exception("Failed to get shipping letters.");
    }
  }

  Future<ShippingLetterDto> getShippingLetterById(String id, String userId) async {
    try {
      final doc = await _firestore.collection('users').doc(userId).collection('documents').doc(id).get();

      if (doc.data() == null) {
        throw Exception("Shipping letter not found.");
      }

      return ShippingLetterDto.fromJson(doc.data() as Map<String, dynamic>);
    } catch (e) {
      throw Exception("Failed to get shipping letter.");
    }
  }
}
