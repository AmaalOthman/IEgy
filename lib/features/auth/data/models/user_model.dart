class UserModel {
  UserModel({
    required this.image,
    required this.address,
    required this.name,
    required this.about,
    required this.createdAt,
    required this.lastActive,
    required this.id,
    required this.isOnline,
    required this.email,
    required this.pushToken,
    required this.phone,
    required this.is_student,
    required this.lessons_num,
    required this.student_id,
    required this.level,
    required this.male
  });

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
    data['phone'] = phone
    return data;
  }
}
