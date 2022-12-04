import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  Future<DocumentSnapshot?> _userLookup(String studentNumber) async {
    final CollectionReference users =
        FirebaseFirestore.instance.collection('users');
    final query =
        users.where('student_number', isEqualTo: studentNumber).limit(1);
    return await query.get().then((querySnapShot) => querySnapShot.docs[0]);
  }

  Future<bool> addUser({
    required String username,
    required String email,
    required String studentNumber,
    int totalCoins = 5,
  }) async {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');

      return await users
          .add({
            'username': username,
            'email': email,
            'student_number': studentNumber,
            'total_coins': totalCoins,
          })
          .then((documentSnapshot) => true)
          .catchError((error) => false);
    } catch (e) {
      return false;
    }
  }

  Future<bool> removeUser(String studentNumber) async {
    try {
      final DocumentSnapshot? userDocument = await _userLookup(studentNumber);
      return userDocument == null
          ? false
          : await userDocument.reference
              .delete()
              .then((value) => true)
              .catchError((error) => false);
    } catch (e) {
      return false;
    }
  }

  Future<bool?> hasUser(String studentNumber) async {
    try {
      return await _userLookup(studentNumber) != null;
    } catch (e) {
      return null;
    }
  }

  Future<bool> addReferralBonus(String referrerStudentNumber, int bonus) async {
    try {
      final DocumentSnapshot? referrerDocument =
          await _userLookup(referrerStudentNumber);

      if (referrerDocument == null) {
        return false;
      }

      final int currCoinCount = referrerDocument.get('total_coins');
      return await referrerDocument.reference
          .update({
            'total_coins': currCoinCount + bonus,
          })
          .then((value) => true)
          .catchError((error) => false);
    } catch (e) {
      return false;
    }
  }
}
