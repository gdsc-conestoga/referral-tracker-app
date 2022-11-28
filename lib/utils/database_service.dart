import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  Future<String?> addUser({
    required String username,
    required String email,
    required String studentNumber,
    int totalCoins = 5,
  }) async {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');

      await users.add({
        'username': username,
        'email': email,
        'student_number': studentNumber,
        'total_coins': totalCoins,
      });

      return 'success';
    } catch (e) {
      return 'Error adding user';
    }
  }
}
