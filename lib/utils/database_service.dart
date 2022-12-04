import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  Future<DocumentSnapshot?> _userLookup(String studentNumber) async {
    final CollectionReference users =
        FirebaseFirestore.instance.collection('users');
    final QuerySnapshot query = await users
        .where('student_number', isEqualTo: studentNumber)
        .limit(1)
        .get();
    return query.size > 0 ? query.docs[0] : null;
  }

  Future<bool> addUser({
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
          .add({
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

  Future<bool> removeUser(String studentNumber) async {
    bool userIsRemoved = true;
    try {
      final DocumentSnapshot? userDocument = await _userLookup(studentNumber);
      userIsRemoved = (userDocument == null)
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

  Future<bool?> hasUser(String studentNumber) async {
    bool? userExists = true;
    try {
      userExists = (await _userLookup(studentNumber) != null);
    } catch (e) {
      userExists = null;
    }
    return userExists;
  }

  Future<bool> addReferralBonus(String referrerStudentNumber, int bonus) async {
    bool bonusIsAdded = true;
    try {
      final DocumentSnapshot? referrerDocument =
          await _userLookup(referrerStudentNumber);

      if (referrerDocument == null) {
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
