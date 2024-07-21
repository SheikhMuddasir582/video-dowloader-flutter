import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // Method to fetch the premium status
  static Future<bool> getPremiumStatus() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('Premium')
        .doc('Check Premium')
        .get();
    
    // Return the value of the Premium field, default to false if null
    return snapshot.get('Premium') ?? false;
  }
}
