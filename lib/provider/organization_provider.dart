import 'package:flutter/material.dart';
import '../model/organization_model.dart';
import '../service/organization_service.dart';

class OrganizationProvider with ChangeNotifier {
  final OrganizationService _service;
  Organization? _organization;

  OrganizationProvider(this._service);

  Organization? get organization => _organization;

  Future<void> createOrganization(String name, String ownerId, String code, String password) async {
    await _service.createOrganization(name, ownerId, code, password);
    notifyListeners();
  }

  Future<void> loadOrganization(String orgId) async {
    _organization = await _service.getOrganization(orgId);
    notifyListeners();
  }

  Future<bool> joinOrganization(String code, String password, String userId, String role) async {
    bool success = await _service.joinOrganization(code, password, userId, role);
    if (success) notifyListeners();
    return success;
  }
}
