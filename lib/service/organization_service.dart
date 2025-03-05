import '../model/organization_model.dart';
import '../repository/organization_repo.dart';

class OrganizationService {
  final OrganizationRepository _repo;

  OrganizationService(this._repo);

  Future<void> createOrganization(String name, String ownerId, String code, String password) async {
    final org = Organization(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      ownerId: ownerId,
      members: {ownerId: 'admin'},
      code: code,
      password: password,
    );
    await _repo.createOrganization(org);
  }

  Future<Organization?> getOrganization(String orgId) async {
    return await _repo.getOrganization(orgId);
  }

  Future<bool> joinOrganization(String code, String password, String userId, String role) async {
    return await _repo.validateOrganization(code, password, userId, role);
  }
}