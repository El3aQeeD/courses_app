class UserModel {
  String? id;
  String? name;
  String? email;
  String? password;

  UserModel({required this.id, required this.name,required this.email,required this.password});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['Name'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
