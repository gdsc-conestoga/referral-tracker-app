import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  Future<DocumentSnapshot> documentLookupByUuid(String uuid) async {
    final CollectionReference users =
        FirebaseFirestore.instance.collection('users');
    return await users.doc(uuid).get();
  }

  Future<bool> addUser(
    String uuid, {
    required String username,
    required String email,
    required String studentNumber,
    int totalCoins = 5,
  }) async {
    bool userIsAdded = true;
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');

      userIsAdded = await users
          .doc(uuid)
          .set({
            'username': username,
            'email': email,
            'student_number': studentNumber,
            'total_coins': totalCoins,
          })
          .then((documentSnapshot) => true)
          .catchError((error) => false);
    } catch (e) {
      userIsAdded = false;
    }

    return userIsAdded;
  }

  Future<bool> removeUser(String uuid) async {
    bool userIsRemoved = true;

    try {
      final DocumentSnapshot userDocument = await documentLookupByUuid(uuid);
      userIsRemoved = userDocument.exists
          ? false
          : await userDocument.reference
              .delete()
              .then((value) => true)
              .catchError((error) => false);
    } catch (e) {
      userIsRemoved = false;
    }

    return userIsRemoved;
  }

  Future<bool> hasUser(String uuid) async {
    final DocumentSnapshot document = await documentLookupByUuid(uuid);
    return document.exists;
  }

  Future<bool> addReferralBonus(String referrerStudentID, int bonus) async {
    bool bonusIsAdded = true;
    try {
      final DocumentSnapshot referrerDocument =
          await documentLookupByUuid(referrerStudentID);

      if (!referrerDocument.exists) {
        bonusIsAdded = false;
      } else {
        final int currCoinCount = referrerDocument.get('total_coins');
        bonusIsAdded = await referrerDocument.reference
            .update({
              'total_coins': currCoinCount + bonus,
            })
            .then((value) => true)
            .catchError((error) => false);
      }
    } catch (e) {
      bonusIsAdded = false;
    }

    return bonusIsAdded;
  }
}
