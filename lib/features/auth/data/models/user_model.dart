class UserModel {
  UserModel({
    required this.image,
    required this.address,
    required this.name,
    required this.id,
    required this.email,
    required this.pushToken,
    required this.phone,
  });

  static const String collectionName = 'users';
  late final image;
  late final address;
  late final name;
  late final id;
  late final email;
  late final pushToken;
  late final phone;

  UserModel.fromJson(Map<String, dynamic> json) {
    image = json['image'] ?? '';
    address = json['address'] ?? '';
    name = json['name'] ?? '';
    id = json['id'] ?? '';
    email = json['email'] ?? '';
    pushToken = json['push_token'] ?? '';
    phone = json['phone'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['image'] = image;
    data['address'] = address;
    data['name'] = name;
    data['id'] = id;
    data['email'] = email;
    data['push_token'] = pushToken;
    data['phone'] = phone;
    return data;
  }
}
