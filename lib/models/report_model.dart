import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tunctexting/models/message.dart';

class ReportService {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  ReportService({
    FirebaseFirestore? firestore,
    FirebaseAuth? auth,
  })  : _firestore = firestore ?? FirebaseFirestore.instance,
        _auth = auth ?? FirebaseAuth.instance;

  Future<void> reportContent(Message messageData) async {
    try {
      User? currentUser = _auth.currentUser;
      if (currentUser == null) {
        throw Exception('User is not logged in');
      }

      DocumentSnapshot reportedUserDoc =
          await _firestore.collection('users').doc(messageData.senderId).get();
      String reportedUserName = reportedUserDoc['name'] ?? 'Unknown User';

      await _firestore.collection('reports').add({
        'reporterId': currentUser.uid,
        'reporterName': currentUser.displayName ?? 'Unknown User',
        'reportedUserId': messageData.senderId,
        'reportedUserName': reportedUserName,
        'messageId': messageData.messageId,
        'messageContent': messageData.text,
        'timestamp': FieldValue.serverTimestamp(),
      });

      return;
    } catch (e) {
      print('Error creating report: $e');
      throw Exception('Failed to report content');
    }
  }
}
