class Organization {
  final String id;
  final String name;
  final String ownerId;
  final Map<String, String> members;
  final String code;
  final String password;

  Organization({
    required this.id,
    required this.name,
    required this.ownerId,
    required this.members,
    required this.code,
    required this.password,
  });

  factory Organization.fromMap(String id, Map<String, dynamic> data) {
    return Organization(
      id: id,
      name: data['name'],
      ownerId: data['ownerId'],
      members: Map<String, String>.from(data['members'] ?? {}),
      code: data['code'],
      password: data['password'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'ownerId': ownerId,
      'members': members,
      'code': code,
      'password': password,
    };
  }
}
