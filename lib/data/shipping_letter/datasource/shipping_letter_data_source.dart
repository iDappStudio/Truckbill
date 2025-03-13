import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:truckbill/data/shipping_letter/dtos/shipping_letter_dto.dart';
import 'package:truckbill/domain/mapper/shipping_letter_mapper/shipping_letter_mapper.dart';
import 'package:truckbill/domain/shipping_letter/models/shipping_letter.dart';

@singleton
class ShippingLetterDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> createShippingLetter(ShippingLetter letter) async {
    final user = _auth.currentUser;
    if (user == null) {
      throw Exception("No logged-in user.");
    }

    try {
      final dto = ShippingLetterMapper.toDto(letter);

      await _firestore.collection('users').doc(user.uid).collection('documents').add(dto.toJson());
    } catch (e) {
      throw Exception("Failed to create shipping letter.");
    }
  }

  Future<List<ShippingLetter>> getShippingLetter() async {
    final user = _auth.currentUser;
    if (user == null) {
      throw Exception("No logged-in user.");
    }

    try {
      final querySnapshot = await _firestore.collection('users').doc(user.uid).collection('documents').get();

      return querySnapshot.docs.map((doc) {
        final dto = ShippingLetterDto.fromJson(doc.data());
        return ShippingLetterMapper.toDomain(dto);
      }).toList();
    } catch (e) {
      throw Exception("Failed to get shipping letters.");
    }
  }

  Future<ShippingLetter> getShippingLetterById(String id) async {
    final user = _auth.currentUser;
    if (user == null) {
      throw Exception("No logged-in user.");
    }

    try {
      final doc = await _firestore.collection('users').doc(user.uid).collection('documents').doc(id).get();

      if (doc.data() == null) {
        throw Exception("Shipping letter not found.");
      }

      final dto = ShippingLetterDto.fromJson(doc.data() as Map<String, dynamic>);
      return ShippingLetterMapper.toDomain(dto);
    } catch (e) {
      throw Exception("Failed to get shipping letter.");
    }
  }
}
