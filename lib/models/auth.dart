

class Auth {

  String? name;
  String? email;
  String? phone;
  String? address;
  Auth({this.name, this.email, this.phone});

  Auth.fromJson(Map json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
  }
}