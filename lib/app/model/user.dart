class UserModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? address;
  String? photoUrl;
  String? accessToken;

  UserModel({
     this.id,
    this.name,
    this.email,
    this.phone,
    this.address,
    this.photoUrl,
     this.accessToken,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      photoUrl: json["PhotoUrl"],
      address: json['address'],
      accessToken: json['access_token'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['access_token'] = this.accessToken;
    data["PhotoUrl"]=this.photoUrl;
    return data;
  }
}
