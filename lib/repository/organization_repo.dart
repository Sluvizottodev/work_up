import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/organization_model.dart';

class OrganizationRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createOrganization(Organization org) async {
    await _db.collection('organizations').doc(org.id).set(org.toMap());
  }

  Future<Organization?> getOrganization(String orgId) async {
    final doc = await _db.collection('organizations').doc(orgId).get();
    if (doc.exists) {
      return Organization.fromMap(doc.id, doc.data()!);
    }
    return null;
  }

  Future<bool> validateOrganization(String code, String password, String userId, String role) async {
    final query = await _db
        .collection('organizations')
        .where('code', isEqualTo: code)
        .where('password', isEqualTo: password)
        .get();

    if (query.docs.isNotEmpty) {
      final orgId = query.docs.first.id;
      await _db.collection('organizations').doc(orgId).update({
        'members.$userId': role,
      });
      return true;
    }
    return false;
  }
}
